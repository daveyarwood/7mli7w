# Julia, Day 1, Hard #1
# Use a 90° rotation matrix to rotate the unit vector [1; 0; 0]

# ref: http://en.wikipedia.org/wiki/Rotation_matrix#Rotation_matrix_from_axis_and_angle

u = [1.0 ; 0.0 ; 0.0]

rotation_matrix = [(cos(90) + (abs2(u[1]) * (1 - cos(90))))
                   ((u[1] * u[2] * (1 - cos(90))) - (u[3] * sin(90)))
                   ((u[1] * u[3] * (1 - cos(90))) + (u[2] * sin(90))) ;

                   ((u[2] * u[1] * (1 - cos(90))) + (u[3] * sin(90)))
                   (cos(90) + (abs2(u[2]) * (1 - cos(90))))
                   ((u[2] * u[3] * (1 - cos(90))) - (u[1] * sin(90))) ;

                   ((u[3] * u[1] * (1 - cos(90))) - (u[2] * sin(90)))
                   ((u[3] * u[2] * (1 - cos(90))) + (u[1] * sin(90)))
                   (cos(90) + (abs2(u[3]) * (1 - cos(90))))]

println(u * rotation_matrix)

# welp, this doesn't work. TIL i can't math
