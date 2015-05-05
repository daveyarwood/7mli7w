-- Elm, Day 2, Easy #2
-- Write a signal to display the current mouse Y-value when the button is
-- pressed.

import Graphics.Element exposing (..)
import Signal exposing (..)
import Mouse
import Text exposing (fromString)

displayY (x, y) = 
  flow right 
  [ leftAligned (fromString "Y-Position: ")
  , show y
  ]

main = sampleOn Mouse.clicks (displayY <~ Mouse.position)