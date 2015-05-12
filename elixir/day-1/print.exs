defmodule ListExample do
  def print [] do :ok end
  def print [head|tail] do
    IO.puts head
    print tail
  end
end

ListExample.print [:storm, :sabretooth, :mystique]