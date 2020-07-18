require 'standard_draw_tk'

x = [ 0.1, 0.2, 0.3, 0.2 ]
y = [ 0.2, 0.3, 0.2, 0.1 ]
StdDraw.filled_polygon(x, y)

x = [ 0.3, 0.4, 0.5, 0.4 ]
y = [ 0.4, 0.5, 0.4, 0.3 ]
StdDraw.polygon(x, y)
StdDraw.run
