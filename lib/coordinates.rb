class StandardDrawTk::Coordinates
  BORDER = 0.00
  DEFAULT_MIN = 0.0
  DEFAULT_MAX = 1.0
  DEFAULT_SIZE = 512

  attr_reader :width, :height

  def initialize
    @height = @width = DEFAULT_SIZE
    @xmin = @ymin = DEFAULT_MIN
    @xmax = @ymax = DEFAULT_MAX
  end

  def init
    set_xscale(DEFAULT_XMIN, DEFAULT_XMAX)
    set_yscale(DEFAULT_YMIN, DEFAULT_YMAX)
  end

  def scale_x(x)
    @width  * (x - @xmin) / (@xmax - @xmin)
  end

  def scale_y(y)
    @height * (@ymax - y) / (@ymax - @ymin)
  end

  def factor_x(w)
    w * @width  / (@xmax - @xmin).abs
  end

  def factor_y(h)
    h * @height / (@ymax - @ymin).abs
  end

  def user_x(x)
    @xmin + x * (@xmax - @xmin) / @width
  end

  def user_y(y)
    @ymax - y * (@ymax - @ymin) / @height
  end

  def box(x, y, r)
    [x - r, y - r, x + r, y + r]
  end

  def set_xscale(min, max)
    size = max - min
    throw 'the min and max are the same' if size == 0.0
    @xmin = min - BORDER * size
    @xmax = max + BORDER * size
  end

  def set_yscale(min, max)
    size = max - min
    throw 'the min and max are the same' if size == 0.0
    @ymin = min - BORDER * size
    @ymax = max + BORDER * size
  end
end
