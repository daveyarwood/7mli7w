-- Elm sure is changing a lot! I had to google a bunch of things to find the current
-- way to do them in version 0.15. So, keeping track of the updated code here.

-- (from last chapter) data -> type / type alias
-- lift -> Signal.map
-- asText -> Graphics.Element.show
-- Signal.count no longer exists... now you have to do it manually:
  -- count = Signal.foldp (\_ count -> count + 1) 0
-- Graphics.Input.input -> Signal.channel (0.14) -> Signal.mailbox (0.15)
  -- in general, fields/inputs/signals are way different now... 
  -- had to read the docs and look at some examples to get it right

------------------------------------------------------------------
import Mouse
import Graphics.Element

main = Signal.map Graphics.Element.show Mouse.position
------------------------------------------------------------------
import Mouse
import Graphics.Element

main = Signal.map Graphics.Element.show 
         (Signal.foldp (\_ count -> count + 1) 0 Mouse.position)
------------------------------------------------------------------
import Mouse
import Graphics.Element

main = Signal.map Graphics.Element.show 
         (Signal.foldp (\_ count -> count + 1) 0 Mouse.clicks)
------------------------------------------------------------------
import Keyboard
import Graphics.Element

main = Signal.map Graphics.Element.show Keyboard.arrows
------------------------------------------------------------------
import Mouse
import Graphics.Element

clickPosition = Signal.sampleOn Mouse.clicks Mouse.position

main = Signal.map Graphics.Element.show clickPosition
------------------------------------------------------------------
import Mouse
import Window
import Graphics.Element

div x y = Graphics.Element.show ((toFloat x) / (toFloat y))

main = Signal.map2 (div) Mouse.y Window.height
------------------------------------------------------------------
import Keyboard
import Graphics.Element

main = Signal.map Graphics.Element.show 
         (Signal.foldp (\dir presses -> presses + dir.x) 
                       0 Keyboard.arrows)
------------------------------------------------------------------
import String
import Graphics.Input.Field exposing (..)
import Graphics.Element exposing (..)

content = Signal.mailbox noContent

shout = String.toUpper
whisper = String.toLower
echo text = (shout text) ++ " " ++ (whisper text)

scene fieldContent =
  flow down
  [ field defaultStyle (Signal.message content.address) "Speak" fieldContent
  , show (echo fieldContent.string)
  ]
  
main = Signal.map scene content.signal