# Julia, Day 1, Easy #1
# Use typeof to find the types of types / operators.
using FactCheck

facts("finding the types of things") do
    context("types of types") do
        @fact typeof(Symbol)   => DataType
        @fact typeof(Int64)    => DataType
        @fact typeof(DataType) => DataType
    end
    context("types of operators") do 
        @fact typeof(+)        => Function
        @fact typeof(*)        => Function
    end
end
