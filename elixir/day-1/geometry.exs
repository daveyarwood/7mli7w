defmodule Rectangle do
  def area {h, w} do
    h * w
  end 

  def perimeter {h, w} do 
    2 * (h + w)
  end 
end

defmodule Square do
  def area {w} do
    Rectangle.area {w, w}
  end

  def area({w, h}) when w == h do 
    Rectangle.area {w, w}
  end

  def perimeter {w} do 
    Rectangle.perimeter {w, w}
  end

  def perimeter({w, h}) when w == h do 
    Rectangle.perimeter {w, w}
  end
end

r = {3, 4}
IO.puts "The area of rectangle #{inspect r} is #{Rectangle.area r}"

s = {4}
IO.puts "The area of square #{inspect s} is #{Square.area s}"

IO.puts "The area of rectangle #{inspect r} is #{Square.area r}"