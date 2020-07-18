require 'standard_draw_tk'

n = 50
a = []

0.upto(n) do |i|
  a[i] = rand
end

0.upto(n) do |i|
  x = 1.0 * i / n
  y = a[i] / 2.0
  rw = 0.5 / n
  rh = a[i] / 2.0
  StdDraw.filled_rectangle(x, y, rw, rh)
end
StdDraw.run
