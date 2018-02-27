using Plots

function LagrangeInterpolation(a...)
    nargs = length(a)
    P = function(x)
            f = 0
            for i in 1:nargs
                L = 1
                for j in 1:nargs
                    if j == i
                        continue
                    end
                    L *= (x-a[j][1]) / (a[i][1] - a[j][1])
                end
                L *= a[i][2]
                f += L
            end
            return f
        end
    return P
end

P = LagrangeInterpolation((1,1), (2,4), (3,7), (5,9))
x = 1:0.1:5
f = zeros(length(x))
for i in 1:length(x)
    f[i] = P(x[i])
end

gr()
plot(x, f;xlabel="x", ylabel="y", xlims=(0,6), ylims=(0,10), legend=false)
savefig("../figures/LagrangeInterpolation.png")
