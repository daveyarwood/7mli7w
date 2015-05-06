-- Elm, Day 2, Medium #2
-- Write a program that counts up from 0, one count per second.

import Graphics.Element exposing (..)
import Time exposing (..)

counter = Signal.foldp (\_ count -> count + 1) 0 (every second)

main = Signal.map show counter