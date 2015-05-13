# Elixir, Day 1, Easy #3
# Convert a string to an atom

now = "now"

IO.puts "#{inspect now} i'm a string"
IO.puts "#{inspect (String.to_atom now)} i'm an atom"
