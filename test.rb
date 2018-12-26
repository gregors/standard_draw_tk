require_relative './standard_draw'

n = 50
StdDraw.set_xscale(0,n)
StdDraw.set_yscale(0,n*n)
StdDraw.set_pen_radius(0.01)
StdDraw.point(10, 10)
StdDraw.point(10, 10)

1.upto(n) do |i|
  StdDraw.point(i, i)
  StdDraw.point(i, i*i)
  StdDraw.point(i, i*Math.log(i))
end
