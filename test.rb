require_relative './standard_draw'

n = 50
StdDraw.set_xscale(0,n)
StdDraw.set_yscale(0,n*n)
StdDraw.pen_radius = 0.01

1.upto(n) do |i|
  StdDraw.point(i, i)
  StdDraw.point(i, i*i)
  StdDraw.point(i, i*Math.log(i))
end
StdDraw.pause
