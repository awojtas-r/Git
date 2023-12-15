 #= <head> =#
 #=    <meta charset="utf-8"> =#
 #=    $tags =#
 #=    <% Stipple.sesstoken() %> =#
 #=    <title>$title</title> =#
 #=    <% if isfile(joinpath(Genie.config.server_document_root, "css", "genieapp.css")) %> =#
 #=    <link rel='stylesheet' href='$(Genie.Configuration.basepath())/css/genieapp.css'> =#
 head(link(rel="stylesheet", href="/css/genieapp.css"))

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

page(model, partial=true, [@yield])
