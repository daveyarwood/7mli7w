# Julia, Day 2, Easy #3
# Use pmap to take an array of trial counts and produce the number of heads 
# found for each element.

@everywhere function pflip_coins(times)
  @parallel (+) for i = 1:times
    int(randbool())
  end
end

@everywhere trial_counts = [1, 5, 10, 25, 50, 100, 500, 1000]

println(pmap(pflip_coins, trial_counts))
