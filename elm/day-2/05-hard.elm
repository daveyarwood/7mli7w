-- Elm, Day 2, Hard #1
-- Use foldp to make the car move from left to right, then right to left, along
-- the bottom of the screen.

import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Color exposing (..)
import Window
import Signal exposing (..)
import Time exposing (..)

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

driving = foldp (\_ (carX, direction) ->
                  let x = if direction == Left 
                          then carX - 5
                          else carX + 5
                      dir = if x < -50 then Right
                            else if x > 1700 then Left
                            else direction
                  in (x, dir))
                (0, Right)
                (fps frameRate)

main = drawCar <~ driving ~ Window.height