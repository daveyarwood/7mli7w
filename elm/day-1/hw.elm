-- Elm, Day 1 Homework

-- Easy #1
product = List.product  -- :P   OK, how about...
product = List.foldl (*) 1

-- Easy #2
allXs = List.map (\point -> point.x)  -- or...
allXs = List.map .x

-- Easy #3
type alias Address = {number:Int, 
                      street:String, 
                      city:String, 
                      state:String, 
                      zip:Int}

type alias Person = {name:String, age:Int, address:Address}

dave = Person "Dave" 29 (Address 555 "Fake St" "Durham" "NC" 27713)

-- Easy #4
-- Is it easier to use abstract data types or records? I don't know,
-- I already tried data types, let's try records now:
dave = {name="Dave", age=29, address={
                               number=555, 
                               street="Fake St",
                               city="Durham",
                               state="NC",
                               zip=27713}}

-- That was easier. I do like how abstract data types give you a schema, though.

-- Medium #1
multiply = (*)   -- or...
multiply = \x y -> x * y  

-- Medium #2
times6 = multiply 6
times6 8

-- Medium #3
people = [{name="Dave", age=29}, {name="Renay", age=33},
          {name="Steve", age=11}, {name="Barbara", age=5}]

List.filter (\p -> p.age < 16) people

-- Hard #1
people = [{name="Dave", age=Just 29}, {name="Renay", age=Just 33},
          {name="Steve", age=Just 11}, {name="Barbara", age=Just 5},
          {name="Odin", age=Nothing}]

List.filter (\p -> Maybe.withDefault 0 p.age < 16) people