java_import 'StdDraw'

n = 50
Java::StdDraw.set_xscale(0,n)
Java::StdDraw.set_yscale(0,n*n)
Java::StdDraw.pen_radius = 0.02

1.upto(n) do |i|
  Java::StdDraw.point(i, i)
  Java::StdDraw.point(i, i*i)
  Java::StdDraw.point(i, i*Math.log(i))
end
