-- Idris, Day 1, Easy #2
-- Find every other member of a list, starting with the first member.

module Main

part : Integer -> List Integer -> List (List Integer) 
part x [] = []
part x ys = [(take x ys)] ++ (part x (drop x ys))

everyOther : Integer -> List Integer -> List Integer
everyOther x ys = -- stopping here... it shouldn't be this hard to map head over a list! wtf, idris?

main : IO ()
main = putStrLn (show (everyOther [1..10]))
