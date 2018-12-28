require 'standard_draw_tk'

n = 100
puts StdDraw.set_xscale(0,n)
puts StdDraw.set_yscale(0,n*n)
StdDraw.pen_radius = 0.01

1.upto(n) do |i|
  StdDraw.point(i, i)
  StdDraw.point(i, i*i)
  StdDraw.point(i, i*Math.log(i))
end
StdDraw.pause
