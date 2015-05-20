# Julia, Day 1, Medium #2
# Merge two dictionaries. 
using FactCheck

d1 = [:a => 1, :b => 2] 
d2 = [:c => 3, :d => 4]

facts("merging dictionaries") do
    @fact merge(d1, d2) => [:a => 1, :b => 2, :c => 3, :d => 4]
end
