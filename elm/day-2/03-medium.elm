-- Elm, Day 2, Medium #1
-- Draw a picture at the current mouse position, change the picture when the 
-- mouse is clicked.

import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Color exposing (..)
import Mouse
import Window

-- props again to Charlie Harvey for the normalizing (X,Y) part of this!
-- surprisingly, it's not very intuitive to do this in Elm

minmax : Int -> Int -> Float
minmax a d = 
  if | a < 44 -> 44.0
     | a > d-44  -> toFloat (d - 44) 
     | otherwise -> toFloat a 

normalizeX x w = 
  (minmax x w) - toFloat w / 2

normalizeY y h = 
  0 - ((minmax y h) - toFloat h / 2)

drawShape shape x y w h = 
  shape
  |> moveX (normalizeX x w)
  |> moveY (normalizeY y h)
  
display (w, h) (x, y) down = collage w h
  [ drawShape (if down then (filled red  (ngon 8 40))
                       else (filled blue (ngon 5 30))) 
              x y w h ]
  
main = Signal.map3 display Window.dimensions Mouse.position Mouse.isDown