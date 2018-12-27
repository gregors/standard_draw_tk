require 'tk'

class StdDraw
  BORDER = 0.00
  @@width  = DEFAULT_SIZE = 512
  @@height = DEFAULT_SIZE

  @@xmin = DEFAULT_XMIN = 0.0
  @@ymin = DEFAULT_YMIN = 1.0
  @@xmax = DEFAULT_XMAX = 0.0
  @@ymax = DEFAULT_YMAX = 1.0

  @@pen_radius = DEFAULT_PEN_RADIUS = 0.002

  @@color = 'black'
  @@bg_color = 'white'

  @@root = TkRoot.new
  @@root.title = 'Standard Draw'
  @@canvas = TkCanvas.new(@@root) do
    height @@height
    width @@width
    bg @@bg_color
  end
  @@canvas.pack

  @@thread = Thread.new do
    Tk.mainloop
  end

  def self.box(x, y, r)
    [x - r, y - r, x + r, y + r]
  end

   def self.set_xscale(min, max)
     size = max - min
     throw 'the min and max are the same' if size == 0.0
     @@xmin = min - BORDER * size
     @@xmax = max + BORDER * size
   end

   def self.set_yscale(min, max)
     size = max - min
     throw 'the min and max are the same' if size == 0.0
     @@ymin = min - BORDER * size
     @@ymax = max + BORDER * size
   end

   def self.pen_radius=(radius)
     throw 'pen radius must be nonnegative' if radius <= 0
     @@pen_radius = radius
   end

   def self.pen_color=(color)
     @@color = color
   end

   def self.point(x, y)
     xs = scaleX(x)
     ys = scaleY(y)
     r = @@pen_radius
     scaled_pen_radius = r * DEFAULT_SIZE

     if scaled_pen_radius <= 1
       pixel(x, y)
     else
       x1 = xs - scaled_pen_radius/2
       y1 = ys - scaled_pen_radius/2
       b = self.box(x1, y1, scaled_pen_radius/2)
       TkcOval.new(@@canvas, b, outline: @@color, fill: @@color)
     end
   end

  def self.pixel(x, y)
    x1 = scaleX(x)
    x1 = x1.round
    y1 = scaleY(y)
    y1 = y1.round
    TkcRectangle.new(@@canvas, [x1, y1, x1 + 1, y1 + 1], outline: @@color, fill: @@color)
  end

  def self.scaleX(x)
    @@width  * (x - @@xmin) / (@@xmax - @@xmin)
  end

  def self.scaleY(y)
    @@height * (@@ymax - y) / (@@ymax - @@ymin)
  end

  def self.factor_x(w)
    w * @@width  / (@@xmax - @@xmin).abs
  end

  def self.factor_y(h)
    h * @@height / (@@ymax - @@ymin).abs
  end

  def self.user_x(x)
    @@xmin + x * (@@xmax - @@xmin) / @@width
  end

  def self.user_y(y)
    @@ymax - y * (@@ymax - @@ymin) / @@height
  end


  def self.pause
    @@thread.join
  end
end
