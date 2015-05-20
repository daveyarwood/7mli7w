# Julia, Day 1, Easy #2
# What happens when you try to add a key with the wrong kind of type to a
# typed dictionary?
d = [:a => 2.0, :b => 3.5]
d[:thisis] = :notanumber

#= 
Throws error:
ERROR: `convert` has no method matching convert(::Type{Float64}, ::Symbol) 
 in setindex! at dict.jl:551
=#
