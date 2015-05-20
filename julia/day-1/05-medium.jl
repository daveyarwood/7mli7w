# Julia, Day 1, Medium #1
# Create a matrix and multiply it by its inverse.
using FactCheck

m = [1 3 3; 1 4 3; 1 3 4]
i3 = [1 0 0; 0 1 0; 0 0 1]

facts("multiplying a matrix by its inverse")do
    @fact m * inv(m) => i3 
end
