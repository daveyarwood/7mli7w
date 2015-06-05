data Natural = Zero | Suc Natural

plus : Natural -> Natural -> Natural
plus Zero x1    = x1
plus (Suc x) x1 = Suc (Suc (plus x x1))

-- strangely, the compiler has no problem with this, in contrast to the 
-- narrative of the chapter... wat?
