# Elixir, Day 1, Easy #2
# Write a function to compute the hypotenuse of a right triangle given the
# length of two sides.

defmodule Triangle do
  def hypotenuse x, y do 
    :math.sqrt(x * x + y * y)
  end
end

ExUnit.start
defmodule HypotenuseTest do
  use ExUnit.Case
  test "hypotenuse computation" do 
    assert Triangle.hypotenuse(3, 4) == 5
  end
end