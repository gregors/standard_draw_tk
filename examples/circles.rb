require 'standard_draw_tk'

StdDraw.filled_circle(0.5, 0.5, 0.10)

1.upto(50) do |i|
  StdDraw.circle(0.5, 0.5, 1.0/i)
end
StdDraw.pause
