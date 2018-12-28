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

  def self.coords
    @@coords
  end

  def self.set_xscale(min,max)
    coords.set_xscale(min,max)
  end

  def self.set_yscale(min,max)
    coords.set_yscale(min,max)
  end

  def self.pen_radius=(radius)
    throw 'pen radius must be nonnegative' if radius <= 0
    @@pen_radius = radius
  end

  def self.pen_color=(color)
    @@color = color
  end

  def self.color
    @@color
  end

  def self.line(x0, y0, x1, y1)
    x0 = coords.scale_x(x0)
    y0 = coords.scale_y(y0)
    x1 = coords.scale_x(x1)
    y1 = coords.scale_y(y1)
    TkcLine.new(@@canvas, x0, y0, x1, y1, fill: color)
  end

  def self.circle(x, y, radius)
    draw_circle(x, y, radius, outline: color)
  end

  def self.ellipse(x, y, w, h)
    draw_ellipse(x, y, w, h, outline: color)
  end

  def self.filled_ellipse(x, y, w, h)
    draw_ellipse(x, y, w, h, fill: color)
  end

  def self.filled_circle(x, y, radius)
    draw_circle(x, y, radius, fill: color)
  end

  def self.rectangle(x, y, half_width, half_height)
    draw_rectangle(x, y, half_width, half_height, outline: color)
  end

  def self.filled_rectangle(x, y, half_width, half_height)
    draw_rectangle(x, y, half_width, half_height, fill: color)
  end

  def self.square(x, y, half_length)
    draw_rectangle(x, y, half_length, half_length, outline: color)
  end

  def self.filled_square(x, y, half_length)
    draw_rectangle(x, y, half_length, half_length, fill: color)
  end

  def self.point(x, y)
    draw_circle(x, y, @@pen_radius, outline: color, fill: color)
  end

  def self.pixel(x, y)
    puts 'pixel'
    x1 = coords.scale_x(x).round
    y1 = coords.scale_y(y).round
    TkcRectangle.new(@@canvas, [x1, y1, x1 + 1, y1 + 1], outline: color, fill: color)
  end

  def self.pause
    @@thread.join
  end

  private

  def self.draw_ellipse(x, y, w, h, outline: nil, fill: nil)
    throw 'semi_major_axis must be nonnegative' if w < 0
    throw 'semi_minor_axis must be nonnegative' if h < 0

    xs = coords.scale_x(x)
    ys = coords.scale_y(y)
    ws = coords.factor_x(2*w)
    hs = coords.factor_y(2*h)
    if ws <= 1 && hs <= 1
      pixel(x, y)
    else
      x1 = xs - ws/2
      y1 = ys - hs/2
      b = [x1, y1, x1 + ws, y1 + hs]
      TkcOval.new(@@canvas, b, outline: outline, fill: fill)
    end
  end

  def self.draw_circle(x, y, radius, outline: nil, fill: nil)
    throw 'radius must be nonnegative' if radius < 0
    xs = coords.scale_x(x)
    ys = coords.scale_y(y)
    scaled_pen_radius = radius * StandardDrawTk::Coordinates::DEFAULT_SIZE
    if scaled_pen_radius <= 1
      pixel(x, y)
    else
      b = coords.box(xs, ys, scaled_pen_radius/2)
      TkcOval.new(@@canvas, b, outline: outline, fill: fill)
    end
  end

  def self.draw_rectangle(x, y, half_width, half_height, outline: nil, fill: nil)
    throw 'half width must be nonnegative' if half_width < 0
    throw 'half height must be nonnegative' if half_height < 0

    ws = coords.factor_x(2*half_width)
    hs = coords.factor_y(2*half_height)

    if (ws <= 1 && hs <= 1)
      pixel(x, y)
    else
      xs = coords.scale_x(x)
      ys = coords.scale_y(y)
      x = xs - ws/2
      y = ys - hs/2
      TkcRectangle.new(@@canvas, x, y, x + (ws-1), y + (hs-1), outline: outline, fill: fill)
    end
  end
end
