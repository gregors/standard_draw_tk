require 'standard_draw_tk'

n = 50
a = []

0.upto(50) do |i|
  a[i] = rand
end

a.sort!

0.upto(50) do |i|
  x = 1.0 * i / n
  y = a[i] / 2.0
  rw = 0.5 / n
  rh = a[i] / 2.0
  StdDraw.filled_rectangle(x, y, rw, rh)
end
StdDraw.pause
