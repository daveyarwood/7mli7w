USING: examples.sequences math tools.test ;
IN: examples.sequences.tests

{ 2 } [ { 1 2 3 4 } [ even? ] find-first ] unit-test
{ f } [ { 1 3 5 7 } [ even? ] find-first ] unit-test