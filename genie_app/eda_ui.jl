container([

    row([
        cell(class="st-col col-12 col-sm st-module", [
            p("Data provided by Maven Analytics and presents transaction records from a fictitious coffee shop in New York City. Dashboard loads zip file from the Maven server, by selecting 'Location', 'Category' and 'Dates' it presents the data in a table/charts. You can download the data in a CSV form. Simple app was created to showcase Genie possiblities using 100 lines of code in total to build the app.")
	    ])
    ])
    row([
        cell(class="st-module", style = "padding: 0px;", [
          row([
            cell(class="st-br", [ 
              bignumber("Min transaction value", :first_bn, id="num", arrow=:first_arr, color=:first_col)
            ])
            cell(class="st-br", [
              bignumber("Max transaction value", :second_bn, id="num", arrow=:second_arr, color=:second_col)
            ])
            cell(class="st-br",  [
              bignumber("Mean transaction value", :third_bn, id="num", arrow=:third_arr, color=:third_col)
            ])
            cell(class="st-br",  [
              bignumber("Placeholder", :total_time, id="num", arrow="up")
            ])
          ])
        ])
      ])
    row([
        cell(class="st-col col-xs st-module st-col col-3", [
        Stipple.select(:location_selection, options=:location, label="Select store location:", optionsdense=true, menushrink=false, rounded=true)
        Stipple.select(:category_selection, options=:category, label="Select category:", optionsdense=true, menushrink=false, rounded=true)
        textfield("Select start date:", :filter_startdate, clearable = true, filled = true, [
            icon(name = "event", class = "cursor-pointer", style = "height: 100%; font_family:Arimo;", [
                popup_proxy(cover = true, [datepicker(:filter_startdate, landscape=true, todaybtn=true, mask = "YYYY-MM-DD")])
            ])
        ])
        textfield("Select end date:", :filter_enddate, clearable = true, filled = true, [
            icon(name="event",class="cursor-pointer",style="height: 100%;", [
                popup_proxy(cover = true, [datepicker(:filter_enddate, landscape=true, todaybtn=true, mask = "YYYY-MM-DD")])
                ])
        ])
        br()
        btn("SUBMIT", color = "primary", icon = "done", iconright=true, size="sm", dense=true, padding="sm", @click("btn_process = !btn_process"), [tooltip("Click to fetch the data")])
	])
        cell(class="st-col col-sm st-module st-col col-9", [
        Stipple.table(:dat, dense=false, flat=true, color="primary", bordered=true,
        title = "Main table",
        var"row-key" = "store_location",
        filter = :TableSearch_dfilter)
        btn("DOWNLOAD", @click(:dfile), color = "primary", icon = "file_download", iconright=true, size="sm", dense=true, padding="sm", [tooltip("Click to download CSV data")])
        a(id="dynamicLink", var":href"="linkhref")
        ])
    ])
    footer(class = "st-footer q-pa-sm", ["App created and maintained by Adam Wojtas. Click&nbsp;", a(href = "https://twitter.com/AdamWojtas_", target = "_blank", "here"), "&nbsp;to find me on X platform."])
])     
