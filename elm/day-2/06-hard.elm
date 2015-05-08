-- Elm, Day 2, Hard #2
-- Building on the last exercise, make the car move faster when the mouse is 
-- farther to the right, and slower when it's farther to the left.

-- (This just barely doesn't work. Elm is confusing. @#$%...)

import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Color exposing (..)
import Window
import Signal exposing (..)
import Time exposing (..)
import Mouse

frameRate = 80

carBottom = filled black (rect 160 50)
carTop    = filled black (rect 100 60)
tire      = filled red   (circle 24)

car =
  [ carBottom
  , carTop |> moveY 30
  , tire   |> move (-40, -28)
  , tire   |> move ( 40, -28)
  ]

drawCar (x, _) h = collage x ((h * 2) - 150) car

type Direction = Left | Right

speed = (\x -> x // 18) <~ Mouse.x

driving = foldp (\_ (carX, direction) ->
                  let x = if direction == Left 
                          then carX - 5
                          else carX + 5
                      dir = if x < -50 then Right
                            else if x > 1700 then Left
                            else direction
                  in (x, dir))
                (0, Right)
                (fps (identity <~ speed))

main = drawCar <~ driving ~ Window.height