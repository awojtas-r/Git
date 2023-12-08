module vis
using GenieFramework, PlotlyBase, StipplePlotly
@genietools

trace1 = scatter(; x=1:4, y=[0, 2, 3, 5], mode = "lines")
trace2 = scatter(; x=1:4, y=[3, 5, 1, 7], mode = "lines", line=attr(color="red"))

@app begin
    @out traces = [trace1, trace2]
    @out plotlayout = PlotlyBase.Layout(title="Filled line chart",
    font_family="Amazon Ember",
    plot_bgcolor="white",
    xaxis_title="Transaction date",
    yaxis=attr(
        title_text="Transaction value (\$)",
        title_font=attr(family="Amazon Ember"),
        showgrid=true, 
        gridwidth=1, 
        gridcolor="#F5F5F5"
    ))
end
end