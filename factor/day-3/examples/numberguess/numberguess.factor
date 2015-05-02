! After spending several hours on this, I decided to give up.
! Looking up documentation for Factor... what a mess!
! I did spend a good amount of time learning about how to build UIs in
! Factor, and it's a pretty intriguing system, but I could have really used
! a good tutorial, or even some better examples than the ones that ship
! with Factor, on building a GUI program with Factor.

! My train-wreck of an attempt follows :P

USING: accessors combinators kernel io math.order math.parser math.ranges
       namespaces random ui ui.gadgets.labels ;
IN: examples.numberguess

SYMBOL: the-number
100 [1,b] random the-number set

!!!!!!! copied from the CLI version, for reference !!!!!!!!!!!
: prompt-number ( -- n ) "> " write flush readln string>number ;
: ask-for-number ( -- n ) "Guess my number! (1-100)" print prompt-number nl ;

: respond ( n -- )
  the-number get <=> {
    { [ dup +lt+ = ] [ drop "Higher." print nl ] }
    { [ dup +gt+ = ] [ drop "Lower." print nl ] }
    { [ dup +eq+ = ] [ drop "You win!" print nl ] }
  } cond ;

: game-loop ( -- ) [ ask-for-number dup respond the-number get = not ] loop ;
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

SYMBOL: guess-input
<editor> guess-input set

: <guess-button> ( -- gadget )
  "Guess" [ guess-input get dup editor-string string>number respond clear-editor ] <button> ;

: game-loop ( -- loop )
  250000000 ! ... would need to provide an object implementing tick* and draw* ... ! <game-loop>

MAIN-WINDOW: game { { title "Guess my number" } }
  "Guess my number! (1-100)" <label> >>gadgets ;

MAIN: game