# Julia, Day 2, Medium #2
# Add a method for concat that can concatenate an integer with a matrix.
using FactCheck

function concat(n::Int64, m::Array{Int64,2})
  hcat(fill(n,(2,2)), m)
end

facts() do
  @fact concat(5, [1 2; 3 4]) => [5 5 1 2; 5 5 3 4]
end
