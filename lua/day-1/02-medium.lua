-- Lua, Day 1 Homework -- Medium
-- Using if and while, write a function for_loop(a, b, f) that calls f() on each integer from a to b (inclusive).

function for_loop(a, b, f)
  while a <= b do
    f(a)
    a = a + 1
  end
end