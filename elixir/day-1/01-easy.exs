# Elixir, Day 1, Easy #1
# Express some geometry objects using tuples: a 2D point, a line, a circle, a
# polygon, and a triangle.

# point = {x, y}
point1 = {3, 4}
point2 = {10, 1}
point3 = {5, 7}
point4 = {1, 2}
point5 = {-4, -1}

line = {point1, point2}

# circle = {point, radius}
circle = {point1, 5} 

# polygon = any number of points
polygon = {point1, point2, point3, point4, point5}

# triangle = 3 points
triangle = {point1, point2, point3}