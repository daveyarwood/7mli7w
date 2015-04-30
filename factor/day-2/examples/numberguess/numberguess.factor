USING: combinators kernel io math.order math.parser math.ranges namespaces random ;
IN: examples.numberguess

SYMBOL: the-number
100 [1,b] random the-number set

: prompt-number ( -- n ) "> " write flush readln string>number ;
: ask-for-number ( -- n ) "Guess my number! (1-100)" print prompt-number nl ;

: respond ( n -- )
  the-number get <=> {
    { [ dup +lt+ = ] [ drop "Higher." print nl ] }
    { [ dup +gt+ = ] [ drop "Lower." print nl ] }
    { [ dup +eq+ = ] [ drop "You win!" print nl ] }
  } cond ;

: game-loop ( -- ) [ ask-for-number dup respond the-number get = not ] loop ;

MAIN: game-loop