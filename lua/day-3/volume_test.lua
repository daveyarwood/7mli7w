song = require 'notation'

-- This is a little dumb, but my syntax for volume is 25 units of volume (out of 127 max)
-- per underscore after each note, e.g. _ = 25, __ = 50, ___ = 75, etc., and no underscores
-- defaults to 127.

song.part{
  C4q_, C4q__, C4q___, C4q____, C4q_____, C4q
}

song.go()