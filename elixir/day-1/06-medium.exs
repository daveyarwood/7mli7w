# Elixir, Day 1, Medium #2
# Given a list of atoms, build a function called word_count that returns a
# keyword list, where the keys are atoms from the list and the values are
# the number of occurrences of that word in the list.

defmodule HW do
  @doc "like Map.put, but for keyword lists"
  def list_update kw_list, k, v do
    m = Enum.into kw_list, %{}
    m = Map.put m, k, v
    Map.to_list m
  end
  def word_count xs do
    List.foldl xs, [], fn x, m ->
      list_update m, x, Enum.count(xs, fn y -> x == y end)
    end
  end
end

ExUnit.start
defmodule WordCountTest do
  use ExUnit.Case
  test "counts words" do
    assert HW.word_count([:one, :two, :two]) == [one: 1, two: 2]
  end
end
