-- Lua, Day 1 Homework -- Hard
-- Write a function reduce(max, init, f) that calls a function f() over the integers from 1 to max.

function reduce(max, init, f)
  state = init
  for i = 1, max do
    state = f(state, i)
  end
  return state
end

-- Implement factorial() in terms of reduce().

function factorial(n)
  return reduce(n, 1, function(a, b) return a * b end)
end