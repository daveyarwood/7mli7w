# Julia, Day 2, Medium #3
# Add a new method for + to make "jul" + "ia" work.
using FactCheck

function +(a::ASCIIString, b::ASCIIString)
  string(a, b)
end

facts("string + string") do
  @fact "jul" + "ia" => "julia"
end
