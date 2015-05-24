# Julia, Day 2, Hard
# See if you can beat Julia's parallel for loop version of pflip_coins
# by writing something using lower-level primitives like @spawn or remotecall.

@everywhere function pflip_coins(times)
  @parallel (+) for i = 1:times
    int(randbool())
  end
end

# either my google-fu is weak, or Julia doesn't have a built-in method for 
# partitioning a collection into equal-sized chunks... dafuq?
@everywhere function partition_all(n, coll)
  if length(coll) == 0
    []
  elseif length(coll) < n
    Array[coll]
  else
    vcat(Array[coll[1:n]], partition_all(n, coll[n+1:end]))
  end
end

@everywhere function flip_batch(coins)
  reduce(+, [int(randbool()) for _ in 1:coins])
end

@everywhere function faster_pflip_coins(times)
  batch_size = 1000
  batches = partition_all(batch_size, fill(1, (times, 1)))
  reduce(+, pmap(flip_batch, batches))
end  

# this doesn't work :(  moving on...

println("With parallel flip method...") 
@time pflip_coins(1000000)
println("With more efficient parallel flip method...") 
@time faster_pflip_coins(1000000)
