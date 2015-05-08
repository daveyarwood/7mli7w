module LanguageHead where

import Keyboard
import Mouse
import Random
import Text

-- data modeling

type State = Play | Pause | GameOver

type Input  = { space:Bool, x:Int, delta:Time, rand:Int }
type Head   = { x:Float, y:Float, vx:Float, vy:Float }
type Player = { x: Float, score: Int }
type Game   = { state:State, heads:[Head], player:Player }

defaultHead n = { x=100.0, y=75, vx=60.0, vy=0.0, img=headImage n } 
defaultGame = { state  = Pause,
                heads  = [],
                player = {x=0.0, score=0} }

headImage n =
  if | n == 0 -> "/img/brucetate.png"
     | n == 1 -> "/img/davethomas.png"
     | n == 2 -> "/img/evanczaplicki.png"
     | n == 3 -> "/img/joearmstrong.png"
     | n == 4 -> "/img/josevalim.png"
     | otherwise -> ""

bottom = 550

-- signals

secsPerFrame = 1.0 / 50.0
delta = inSeconds <~ fps 50

input = sampleOn delta (Input <~ Keyboard.space
                               ~ Mouse.x
                               ~ delta
                               ~ Random.range 0 4 (every secsPerFrame))

main = display <~ gameState

gameState = foldp stepGame defaultGame input

-- steps (todo)