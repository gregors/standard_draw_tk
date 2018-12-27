require 'standard_draw_tk/version'
require 'tk'
require_relative './coordinates'

class StdDraw
  @@pen_radius = DEFAULT_PEN_RADIUS = 0.002
  @@coords = StandardDrawTk::Coordinates.new

  @@color = 'black'
  @@bg_color = 'white'

  @@root = TkRoot.new
  @@root.title = 'Standard Draw'
  @@canvas = TkCanvas.new(@@root) do
    height @@coords.height
    width @@coords.width
    bg @@bg_color
  end
  @@canvas.pack
  @@thread = Thread.new do
    Tk.mainloop
  end

  def self.pen_radius=(radius)
    throw 'pen radius must be nonnegative' if radius <= 0
    @@pen_radius = radius
  end

   def self.pen_color=(color)
     @@color = color
   end

   def self.point(x, y)
     xs = scale_x(x)
     ys = scale_y(y)

     r = @@pen_radius
     scaled_pen_radius = r * Coordinates::DEFAULT_SIZE

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
    puts 'pixel'
    x1 = scale_x(x).round
    y1 = scale_y(y).round
    TkcRectangle.new(@@canvas, [x1, y1, x1 + 1, y1 + 1], outline: @@color, fill: @@color)
  end

  def self.pause
    @@thread.join
  end
end
