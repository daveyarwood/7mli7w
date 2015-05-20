# Julia, Day 1, Medium #3
# What is the difference between `sort` and `sort!`?
using FactCheck

a = [2, 3, 1]

facts("sorting") do
    @fact sort(a) => [1, 2, 3]
    @fact sort(a, rev=true) => [3, 2, 1]
    @fact a => [2, 3, 1]
    sort!(a)
    @fact a => [1, 2, 3]
end
