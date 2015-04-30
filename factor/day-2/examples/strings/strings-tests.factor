USING: examples.strings tools.test ;
IN: examples.strings.tests

{ f } [ "MANDELBAUM, MANDELBAUM, MANDELBAUM" palindrome? ] unit-test
{ t } [ "amanaplanacanalpanama" palindrome? ] unit-test