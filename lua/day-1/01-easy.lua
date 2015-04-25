-- Lua, Day 1 Homework -- Easy
-- Create a program to print the first n prime numbers that end in 3.

function ends_in_3(num)
  return(num % 10 == 3)
end

function is_prime(num)
  if num == 1 then return false end
  if num % 2 == 0 then return false end
  for n = 3, (math.sqrt(num) + 1), 2 do
    if num % n == 0 then return false end
  end
  return true
end

-- 'n' is passed in as a command-line argument
n = tonumber(arg[1])
x = 3
counter = 0

while counter < n do
  if is_prime(x) and ends_in_3(x) then
    print(x)
    counter = counter + 1
  end
  x = x + 1
end