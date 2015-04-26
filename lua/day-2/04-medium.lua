-- Lua, Day 2 Homework -- Medium #2
-- Implement a FIFO Queue class using Lua's built-in OO syntax.

--[[
  q = Queue.new() returns a new object (I think this actually needs to be Queue:new())
  q:add(item) adds item past the last one currently on the queue
  q:remove() removes and returns the first item in the queue, or nil if the queue is empty
--]]

Queue = {}

function Queue:new()
  local obj = { queue = {} }
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function Queue:add(item)
  self.queue[#self.queue + 1] = item
end

function Queue:remove()
  if #self.queue < 1 then error "Queue is empty!" end
  local item = self.queue[1]
  for i = 1, #self.queue - 1 do
    self.queue[i] = self.queue[i + 1]
  end
  self.queue[#self.queue] = nil
  return item
end