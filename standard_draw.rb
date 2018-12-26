require 'tk'

class StdDraw

  def initialize
    @root = TkRoot.new
    @root.title = "Window"

    @canvas = TkCanvas.new(@root) do
      place('height' => 170, 'width' => 100, 'x' => 10, 'y' => 10)
    end

    color = 'blue'
    TkcOval.new(@canvas, box(5,5,5), outline: color, fill: color)
  end

   def box(x, y, r)
    [x - r, y - r, x + r, y + r]
   end


  #def point(x,y)
  #  xs = scale_X x
  #  ys = scale_Y y
  #  r = pen_radius
  #  scaled_pen_radius = r * DEFAULT_SIZE

  #  if scaled_pen_radius <= 1
  #    pixel(x, y)
  #  else
  #      #offscreen.fill(new Ellipse2D.Double(xs - scaledPenRadius/2, ys - scaledPenRadius/2, scaledPenRadius, scaledPenRadius))
  #  end

  #  draw
  #end

  #def circle( x, y, r, **kwargs):
  #  TkcOval.new(@canvas, 9)
  #  return self.create_oval(x-r, y-r, x+r, y+r, **kwargs)
  #.Canvas.create_circle = _create_circle

  def draw
    Tk.mainloop
  end

  def pixel(x, y)
  end
end
