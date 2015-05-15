# Elixir, Day 1, Hard #1
# Represent a tree of sentences as tuples. Traverse a tree, presenting 
# an indented list. 

defmodule HW do
  def traverse x do
    traverse x, 0
  end
  def traverse {x, y}, indent_level do 
    Enum.map([x, y], &(traverse &1, indent_level + (if is_tuple(&1) do 
                                                      1 else 0 end))) 
    |> Enum.join "\n"
  end
  def traverse x, indent_level do
    String.duplicate("\t", indent_level) <> x
  end
end

ExUnit.start
defmodule TraverseTest do
  use ExUnit.Case
  test "traversing a tree of sentences" do
    assert HW.traverse({"See Spot.", {"See Spot sit.", "See Spot run."}}) == 
           "See Spot.\n\tSee Spot sit.\n\tSee Spot run."
  end
end
