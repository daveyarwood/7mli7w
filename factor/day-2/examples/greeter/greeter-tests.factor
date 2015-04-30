USING: examples.greeter tools.test ;
IN: examples.greeter.tests

{ "Hello, Test" } [ "Test" greeting ] unit-test
{ "Hello, Dr. Clambake" } [ "Zafo" greeting ] unit-test  ! failing test