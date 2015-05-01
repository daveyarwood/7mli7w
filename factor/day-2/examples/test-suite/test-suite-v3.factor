USING: formatting io io.streams.string kernel math math.parser namespaces
       quotations regexp sequences splitting strings tools.test ;
USE: examples.greeter
USE: examples.sequences
USE: examples.strings
IN: examples.test-suite

SYMBOL: vocab-to-test

: test-vocab ( vocab -- )
  vocab-to-test set
  [ vocab-to-test get test ] with-string-writer
    >string string-lines
    [ R/ ^Unit Test:.*/ matches? ] count dup
    "Ran %d tests." printf nl
  test-failures get [ length ] [ empty? ] bi
    [ 2drop "All tests passed." print ]
    [ dup [ - ] dip "%d passed, %d failed." printf nl :test-failures ] if ;

: prompt-string ( -- n ) "> " write flush readln ;
: ask-for-vocab ( -- n ) "Enter vocabulary name: " write flush readln nl ;

: run-tests ( -- ) ask-for-vocab test-vocab ;

MAIN: run-tests
