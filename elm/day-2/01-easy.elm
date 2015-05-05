-- Elm, Day 2, Easy #1
-- Write a signal to display the current mouse position, including whether a 
-- mouse button is pressed.

import Graphics.Element exposing (..)
import Signal exposing (..)
import Mouse
import Text exposing (fromString)

mouseStats pos clicking = 
  flow down 
  [ flow right 
    [ leftAligned (fromString "Position: ")
    , show pos
    ]
  , flow right 
    [ leftAligned (fromString "Clicking: ")
    , show clicking
    ]
  ]

main = mouseStats <~ Mouse.position ~ Mouse.isDown