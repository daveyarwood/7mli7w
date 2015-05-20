# Julia, Day 1, Easy #4
# What happens when you run various arrays through e.g. sin, round?
using FactCheck

facts("doing things with arrays") do
    @fact sin([1, 2, 3]) => roughly([0.841471, 0.909297, 0.14112])
    @fact round([3.5, 2.3, 1.0]) => [4.0, 2.0, 1.0]
end
