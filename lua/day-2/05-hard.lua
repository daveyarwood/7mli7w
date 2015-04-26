-- Lua, Day 2 Homework, Hard
-- Using coroutines, write a fault-tolerant function retry(count, body) that works as follows:
---- Call the body() function.
---- If body() yields a string with coroutine.yield(), consider this an error message and restart body() from its beginning.
---- Don't retry more than count times; if you exceed count, print an error message and return.
---- If body() returns without yielding a string, consider this a success.

function retry(count, body)
  local generator = coroutine.create(body)
  local succeeded
  local value
  for i = 1, count do
    succeeded, value = coroutine.resume(generator)
    if (not succeeded) or type(value) == 'string' then
      generator = coroutine.create(body)
    else
      return value
    end
  end
end