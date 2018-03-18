using Plots

gr()
cd("/home/hidehisa/hobby/SPAF/scripts")

const dx = 0.05

function foward_differential(func, x_0)
    (func(x_0 + dx) - func(x_0)) / dx
end

function central_differential(func, x_0)
    (func(x_0 + dx) - func(x_0 - dx)) / (2*dx)
end

function make_plot(h, anal_diff, x, xlims, ylims, name)
    data = [anal_diff(x), foward_differential(h, x), central_differential(h, x)]
    linestyle = [:solid :dash :dot]
    color = [:red :green :blue]
    label = ["analytic", "foward", "central"]
    plot(x, data; linestyle=linestyle, color=color, label=label, xlabel="x", ylabel="dy/dx", xlims=xlims,
         ylims=ylims)
    savefig("../figures/"*name)
end

function plot_221()
    f(x) = exp.(2x)
    g(x) = 3x.^2 - 1

    h(x) = f(x) + g(x)
    anal_diff(x) = 2 .* f(x) + 6 .* x
    x = 0.0:0.05:0.5
    xlims = (0.0, 0.5)
    ylims = (0, 10)
    name = "example221.png"

    make_plot(h, anal_diff, x, xlims, ylims, name)
end

function plot_222()
    f(x) = exp.(2x)
    g(x) = 3x.^2-1

    h(x) = f(x).*g(x)
    anal_diff(x) = 2 .* f(x) .* g(x) + 6 .* x .* f(x)
    x = 0.0:0.05:0.5
    xlims = (0.0, 0.5)
    ylims = (-4, 10)
    name = "example222.png"

    make_plot(h, anal_diff, x, xlims, ylims, name)
end

function plot_223()
    f(x) = exp.(2x)
    g(x) = 3x.^2 -1

    h(x) = f(x) ./ g(x)
    anal_diff(x) = 2*exp.(2x) .* (2x.^2 - 3x -1) ./ (3x.^2-1).^2
    x = 0.0:0.05:0.5
    xlims = (0.0, 0.5)
    ylims = (-500, 0)
    name = "example223.png"
    
    make_plot(h, anal_diff, x, xlims, ylims, name)
end

function plot_224()
    f(x) = exp.(2x)
    g(x) = 3f(x).^2 - 1

    anal_diff(x) = 12exp.(4x)
    x = 0.0:0.05:0.5
    xlims = (0.0, 0.5)
    ylims = (0, 100)
    name = "example224.png"

    make_plot(g, anal_diff, x, xlims, ylims, name)
end

function plot_225()
    h(x) = log.(3x.^2-1)
    anal_diff(x) = 6x ./ (3x.^2 - 1)
    x = 0.0:0.05:0.5
    xlims = (1.0, 1.5)
    ylims = (1.0, 3.5)
    name = "example225.png"

    make_plot(h, anal_diff, x, xlims, ylims, name)
end

function ()
    
end

plot_221()
plot_222()
plot_223()
plot_224()
plot_225()