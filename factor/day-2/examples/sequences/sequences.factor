USING: kernel sequences ;
IN: examples.sequences

! returns the first element in the sequence that satisfies the predicate,
! or f if no element in the sequence satisfies the predicate
: find-first ( seq pred -- elt ) filter ?first ; inline