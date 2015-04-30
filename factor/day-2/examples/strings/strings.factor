USING: kernel sequences ;
IN: examples.strings

: palindrome? ( str -- bool ) dup reverse = ;