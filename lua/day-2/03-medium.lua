-- Lua, Day 2 Homework -- Medium
-- Change the global metatable so that any time you try to add two arrays using the plus sign (e.g. a1 + a2),
-- Lua concatenates them together using the concatenate() function from the first Easy exercise.

e1 = require '01-easy'

setmetatable(_G, {
  __newindex = function(t, k, v)
    rawset(t, k, v)
    if type(v) == 'table' then
      setmetatable(t[k], {__add = e1.concatenate})
    end
  end
})