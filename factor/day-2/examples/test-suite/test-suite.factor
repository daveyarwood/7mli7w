USING: io io.streams.null kernel namespaces sequences tools.test ;
USE: examples.greeter
USE: examples.sequences
USE: examples.strings
IN: examples.test-suite

: test-all-examples ( -- )
  [ "examples" test ] with-null-writer
  test-failures get empty?
    [ "All tests passed." print ]
    [ :test-failures ] if ;

MAIN: test-all-examples
