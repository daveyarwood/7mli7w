-- Lua, Day 2 Homework -- Easy #2
-- Modify strict_write() example to allow deleting keys by setting their values to nil.

local _private = {}

function strict_read(table, key)
  if _private[key] then
    return _private[key]
  else
    error("Invalid key: " .. key)
  end
end

function strict_write(table, key, value)
  if _private[key] and value ~= nil then
    error("Duplicate key: " .. key)
  else
    _private[key] = value
  end
end

return {
  mt = {
    __index = strict_read,
    __newindex = strict_write
  }
}