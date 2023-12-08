module App
using GenieFramework
@genietools
include("eda.jl")
include("vis.jl")

@page("/", "eda_ui.jl", layout = "layout.jl", model= eda)
@page("/vis", "vis_ui.jl", layout = "layout.jl", model = vis)
end


