using CSV, DataFrames
using CairoMakie

df_2 = CSV.read(joinpath(@__DIR__, "pme_benchmark_s2.csv"), DataFrame)
df_3 = CSV.read(joinpath(@__DIR__, "pme_benchmark_s3.csv"), DataFrame)
df_4 = CSV.read(joinpath(@__DIR__, "pme_benchmark_s4.csv"), DataFrame)

begin
    fig = Figure(size = (500, 400), fontsize = 20)
    ax = Axis(fig[1, 1], xlabel = "Number of atoms", ylabel = "Time (s)", xscale = log10, yscale = log10)

    scatter!(ax, df_2.n, df_2.t_total, label = "s = 2 (3 digits)", markersize = 10, marker = :diamond, color = :blue)
    scatter!(ax, df_3.n, df_3.t_total, label = "s = 3 (5 digits)", markersize = 10, marker = :utriangle, color = :red)
    scatter!(ax, df_4.n, df_4.t_total, label = "s = 4 (8 digits)", markersize = 10, marker = :dtriangle, color = :green)

    xs = 10 .^ range(3.5, 7, length = 100)
    lines!(ax, xs, xs ./ 10^(6.5), color = :black, linestyle = :dash, linewidth = 3)
    text!(ax, 10^5.3, 10^-(1.8), text = "O(N)", color = :black, fontsize = 20)

    axislegend(ax, position = :lt)
    fig
end

save(joinpath(@__DIR__, "pme_benchmark.svg"), fig)