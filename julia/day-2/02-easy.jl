# Julia, Day 2, Easy #2
# Iterate over a multidimensional array and observe the order in which it 
# gets printed out.

for x in [1 2 3; 4 5 6; 7 8 9]
  println(x)
end

# plot twist! it's 1 4 7 2 5 8 3 6 9

