using ZipFile, XLSX, HTTP, Statistics
url = HTTP.get("https://maven-datasets.s3.amazonaws.com/Coffee+Shop+Sales/Coffee+Shop+Sales.zip")
data = ZipFile.Reader(IOBuffer(url.body))
#("C://Users//awwojtas//Desktop//coffee.zip");
myf=data.files[1]
out =  open(myf.name,"w")
write(out,myf)
close(out)
close(data)
dta = DataFrame(XLSX.readtable("Coffee Shop Sales.xlsx", "Transactions"))
using DataFrames

mean(dta.transaction_qty)

DataFrames.describe(dta, :mean, :min, :max)