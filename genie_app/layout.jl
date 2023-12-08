cell(style="background-color: #263238; padding: 10px 50px; color: #ffffff; top: 0; width: 100%;", [
    cell([ 
    Html.div(style="font-size: 1.5em; font-weight: regular;", [
    imageview(src = "https://cdn.quasar.dev/logo-v2/svg/logo-mono-white.svg", style = "width: 30px;"),
    "&nbsp;Analytics Deck&nbsp;&nbsp;&nbsp;",
    a(href="/", style="padding: 10px; font-size: 12px; color: #ffffff; text-decoration: none;", "Reporting"),
    a(href="/vis", style="padding: 10px; font-size: 12px; color: #ffffff; text-decoration: none;", "Charts")
    ])
  ])
])
            #heading(class="st-header q-pa-sm", style="height: 50px;", img=imageview(src = "https://drive-render.corp.amazon.com/view/awwojtas@/pictures/qts_1.png", style = "width: 50px;"), "&nbsp;Reporting")

page(model, partial=true, [@yield])