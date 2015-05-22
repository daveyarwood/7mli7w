# Julia, Day 2, Medium #1
# Write a factorial function as a parallel for loop.
using FactCheck

function pfactorial(n)
  @parallel (*) for x in 1:n x end
end

facts("parallel factorial") do
  @fact pfactorial(1) => 1
  @fact pfactorial(2) => 2
  @fact pfactorial(3) => 6
  @fact pfactorial(4) => 24
  @fact pfactorial(5) => 120
  @fact pfactorial(6) => 720
end
