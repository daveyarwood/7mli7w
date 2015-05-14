# Elixir, Day 1, Medium #1
# Given a list of numbers, use recursion to find the size of the list, the 
# maximum value, and the minimum value.

defmodule Recursive do
  def length [] do 
    0 
  end
  def length [_|xs] do
    1 + Recursive.length xs 
  end
  def max [x] do
    x
  end
  def max [x|xs] do
    max_xs = max xs
    if x > max_xs do x else max_xs end
  end
  def min [x] do
    x
  end
  def min [x|xs] do
    min_xs = min xs
    if x < min_xs do x else min_xs end
  end
end

ExUnit.start
defmodule RecursiveTest do
  use ExUnit.Case
  test "length" do
    assert (Recursive.length [1, 2, 3]) == 3
  end
  test "max" do
    assert (Recursive.max [4, -1, 99]) == 99
    assert (Recursive.max [-5, -10, -2]) == -2
  end
  test "min" do
    assert (Recursive.min [8, 42, 5]) == 5
    assert (Recursive.min [-3, -2, -1]) == -3
  end
end
