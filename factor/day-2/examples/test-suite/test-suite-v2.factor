USING: formatting io io.streams.string kernel math math.parser namespaces
       regexp sequences splitting strings tools.test ;
USE: examples.greeter
USE: examples.sequences
USE: examples.strings
IN: examples.test-suite

! props to Charlie Harvey for blogging his solution to this!
! It's super hard to google things about Factor, I probably would have
! never figured this out... even if this solution is "kludgy" by his
! account, it is a perfectly fine solution nonetheless!

! (I modified it a bit)

: test-all-examples ( -- )
  [ "examples" test ] with-string-writer
    >string string-lines
    [ R/ ^Unit Test:.*/ matches? ] count dup
    "Ran %d tests." printf nl
  test-failures get [ length ] [ empty? ] bi
    [ 2drop "All tests passed." print ]
    [ dup [ - ] dip "%d passed, %d failed." printf nl :test-failures ] if ;

MAIN: test-all-examples
