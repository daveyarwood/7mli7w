# Elixir, Day 1, Hard #2
# Given an incomplete tic-tac-toe board, compute the next player's best move.

defmodule TTT do
  # representing the positions as numbers 1-9, i.e.:
  #
  #    1 | 2 | 3
  #    ---------
  #    4 | 5 | 6
  #    ---------
  #    7 | 8 | 9

  @doc "Returns a list of the positions occupied by a given letter."
  def collect_letters board, letter do
   idxs = Enum.with_index(Tuple.to_list board) 
   for {val, idx} <- idxs, val == letter, do: idx + 1
  end
  
  @doc "All possible 'three-in-a-row' combinations."
  def triples do
    Enum.map [[1, 2, 3], [4, 5, 6], [7, 8, 9],
              [1, 4, 7], [2, 5, 8], [3, 6, 9],
              [1, 5, 9], [3, 5, 7]], 
             fn triple -> Enum.into(triple, HashSet.new) end
  end

  @doc """
  Given a list of positions occupied by a given letter, determines if there is
  any winning move -- if there is, returns the first position it finds that
  will be a winning move. Returns nil otherwise.
  """
  def winning_move? positions do
    positions = Enum.into positions, HashSet.new
    winning_line = Enum.find triples, fn triple ->
      Set.size(Set.intersection triple, positions) == 2
    end
    if winning_line do
      Enum.at Set.difference(winning_line, positions), 0
    else
      nil
    end
  end

  @doc "Returns true if the center position is available."
  def center_available? board do
    elem(board, 4) == :_
  end

  @doc "Returns the position number of a corner if one is available."
  def corner_available? board do
    corners = [1, 3, 7, 9]
    Enum.find corners, fn corner ->
      elem(board, corner - 1) == :_
    end
  end

  def best_move board, player do
    player = collect_letters board, player
    opponent = collect_letters(board, if player == :O do :X else :O end)
    player_winning_move = winning_move? player
    opponent_winning_move = winning_move? opponent
    center = center_available? board
    corner = corner_available? board

    cond do
      player_winning_move -> player_winning_move
      opponent_winning_move -> opponent_winning_move
      center -> 5
      corner -> corner
      :else -> "¯\_(ツ)_/¯"
    end
  end
end

ExUnit.start
defmodule TTTTest do
  use ExUnit.Case

  test "determining the best move" do
    board = {:_, :_, :_,
             :_, :_, :_,
             :_, :_, :_}
    assert TTT.best_move(board, :X) == 5

    board = {:_, :_, :_,
             :_, :O, :_,
             :_, :_, :_}
    assert TTT.best_move(board, :X) == 1

    board = {:_, :O, :_,
             :_, :O, :_,
             :_, :_, :_}
    assert TTT.best_move(board, :X) == 8

    board = {:_, :X, :O,
             :_, :O, :_,
             :_, :_, :_}
    assert TTT.best_move(board, :X) == 7

    board = {:_, :O, :O,
             :X, :X, :_,
             :_, :_, :_}
    assert TTT.best_move(board, :X) == 6
    
    board = {:_, :_, :O,
             :X, :_, :X,
             :_, :O, :_}
    assert TTT.best_move(board, :X) == 5
  end
end
