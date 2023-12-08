container([

    row([
        cell(class="st-col col-6 col-sm st-module", [
            plot(:traces, layout=:plotlayout)
	    ])
        cell(class="st-col col-6 col-sm st-module", [
            plot(:traces, layout=:plotlayout)
	    ])
    ])

    footer(class = "st-footer q-pa-sm", ["App created and maintained by Adam Wojtas. Click&nbsp;", a(href = "https://twitter.com/AdamWojtas_", target = "_blank", "here"), "&nbsp;to find me on X platform."])
])     