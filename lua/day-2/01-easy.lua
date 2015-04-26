-- Lua, Day 2 Homework -- Easy
-- Write a function called concatenate(a1, a2) that takes two arrays and returns
-- a new array with all the elements of a1 followed by all the elements of a2.

function concatenate(a1, a2)
  local result = {}
  for _, t in ipairs{a1, a2} do
    for _, x in ipairs(t) do
      result[#result + 1] = x
    end
  end
  return result
end

return { concatenate = concatenate }