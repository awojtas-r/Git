module eda
using GenieFramework, DataFrames, CSV, TidierData, Format, ZipFile, XLSX, HTTP, Statistics
@genietools

url = HTTP.get("https://maven-datasets.s3.amazonaws.com/Coffee+Shop+Sales/Coffee+Shop+Sales.zip")
data = ZipFile.Reader(IOBuffer(url.body))
myf=data.files[1]
out =  open(myf.name,"w")
write(out,myf)
close(out)
close(data)
const data_frame = DataFrame(XLSX.readtable("Coffee Shop Sales.xlsx", "Transactions"))
location = unique(data_frame.store_location)
category = unique(data_frame.product_category)

@app begin
    @in location_selection = [""]
    @in category_selection = [""]
    @in btn_process = false
    @in filter_startdate = today() - Day(7)
    @in filter_enddate = today()
    @in dfile = false
    @out dat = DataTable()
    @out location
    @out category
    @out first_bn = 0
    @out first_arr = ""
    @out first_col = ""
    @out second_bn = 0
    @out second_arr = ""
    @out second_col = ""
    @out third_bn = ""
    @out third_arr = ""
    @out third_col = ""
    @out linkhref = "/data.csv"
    @onbutton btn_process begin
        main_data = data_frame[data_frame.store_location .== location_selection[],:]
        main_data = main_data[main_data.product_category .== category_selection[],:]
        main_data = main_data[main_data.transaction_date .>= filter_startdate,:]
        main_data = main_data[main_data.transaction_date .<= filter_enddate,:]
        dat = DataTable(main_data)
        first_bn = maximum(main_data.transaction_qty)
        first_arr = ifelse(first_bn > 0, "up","down")
        first_col = ifelse(first_bn > 0, "positive","negative")
        second_bn = minimum(main_data.transaction_qty)
        second_arr = ifelse(second_bn > 0, "up","down")
        second_col = ifelse(second_bn > 0, "positive","negative")
        third_bn = format(median(main_data.transaction_qty), suffix="%")
        third_bn_a = mean(main_data.transaction_qty)
        third_arr = ifelse(third_bn_a > 0, "up","down")
        third_col = ifelse(third_bn_a > 0, "positive","negative")
    end
    
    @onbutton dfile begin
        main_data = data_frame[data_frame.store_location .== location_selection[],:]
        main_data = main_data[main_data.product_category .== category_selection[],:]
        main_data = main_data[main_data.transaction_date .>= filter_startdate,:]
        main_data = main_data[main_data.transaction_date .<= filter_enddate,:]
        CSV.write("./public/data.csv", main_data)
        sleep(1)
        linkhref = "/data.csv#($(rand(1)))"
    end
end

@mounted """
            setTimeout(() => {
                var linkToWatch = document.getElementById('dynamicLink');
                if (!linkToWatch) {
                    console.error('Link element not found');
                    return;
                }
                var observer = new MutationObserver(function(mutations) {
                    mutations.forEach(function(mutation) {
                        if (mutation.type === 'attributes' && mutation.attributeName === 'href') {
                            console.log('Href changed to:', linkToWatch.href);
                            linkToWatch.click();
                        }
                    });
                });
                observer.observe(linkToWatch, { attributes: true });
            }, 1000); // Delay in milliseconds
        """
end