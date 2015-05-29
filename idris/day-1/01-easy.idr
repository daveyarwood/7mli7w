-- Idris, Day 1, Easy #1
-- Find the numbers in a list that are greater than a given number.

module Main

greaterThan : Integer -> List Integer -> List Integer
greaterThan x ys = filter (\y => y > x) ys

main : IO ()
main = putStrLn (show (greaterThan 5 [1..10]))
