USING: formatting io io.streams.string kernel math math.parser namespaces
       regexp sequences splitting strings tools.test ;
USE: examples.fizzbuzz
USE: examples.checkout
IN: examples.test-suite

: test-all-examples ( -- )
  [ "examples" test ] with-string-writer
    >string string-lines
    [ R/ ^Unit Test:.*/ matches? ] count dup
    "Ran %d tests." printf nl
  test-failures get [ length ] [ empty? ] bi
    [ 2drop "All tests passed." print ]
    [ dup [ - ] dip "%d passed, %d failed." printf nl :test-failures ] if ;

MAIN: test-all-examples
