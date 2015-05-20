# Julia, Day 1, Easy #3
# Create a 5x5x5 array where each 5x5 block is a single number.
using FactCheck

a = fill(0,(5,5,5))
for x in 1:5
    a[:,:,x] = fill(x,(5,5))
end

facts("array values") do
    @fact a[:,:,1] => b -> all(c -> c == 1, b)
    @fact a[:,:,2] => b -> all(c -> c == 2, b)
    @fact a[:,:,3] => b -> all(c -> c == 3, b)
    @fact a[:,:,4] => b -> all(c -> c == 4, b)
    @fact a[:,:,5] => b -> all(c -> c == 5, b)
end
