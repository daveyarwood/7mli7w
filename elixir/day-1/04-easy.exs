# Elixir, Day 1, Easy #4
# Test to see if an expression is an atom.

ExUnit.start
defmodule IsAtomTest do
  use ExUnit.Case
  test "a string" do
    refute is_atom "yo"
  end
  test "a number" do
    refute is_atom 4
  end
  test "a tuple" do
    refute is_atom {:a, 1}
  end
  test "a map" do
    refute is_atom %{cat: "steve", dog: "barbara"}
  end
  test "an atom" do
    assert is_atom :hi
  end
end
