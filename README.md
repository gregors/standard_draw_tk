# Standard Draw TK

The StdDraw class provides a basic capability for creating drawings with your programs. It uses a simple graphics model that allows you to create drawings consisting of points, lines, squares, circles, and other geometric shapes in a window on your computer.

I was going through the excellent [Algorithms 4th edition](https://algs4.cs.princeton.edu/home/) text  and *really* wanted to use ruby instead of the default java. The book makes use of the [Princeton Standard Libraries](https://introcs.cs.princeton.edu/java/stdlib/) to help clarify the code and display useful figures.

The original graphics code uses Java Swing/AWT which works fine with Jruby but not so much with standard ruby. So I started wondering how bad it would be to rewrite it in something MRI friendly. I'm attempting to keep the original interface as much as possible while recreating the logic using the [ruby TK gem](https://github.com/ruby/tk). The graphics drawing portion works but the library is not yet fully complete. See [things to implement](https://github.com/gregors/standard_draw_tk/blob/master/README.md#things-to-implement)

If you need something not yet ported consider using the [jruby wrapper gem](https://rubygems.org/gems/princeton_standard_libraries) that lets you call the original java code in Jruby.

Most of the docs taken/modified from the [original source](https://introcs.cs.princeton.edu/java/stdlib/javadoc/StdDraw.html)

Type the following short program into your editor:

    require 'standard_draw_tk'

    StdDraw.pen_radius = 0.05
    StdDraw.pen_color = StdDraw::BLUE
    StdDraw.point(0.5, 0.5)
    StdDraw.pen_color = StdDraw::MAGENTA
    StdDraw.line(0.2, 0.2, 0.8, 0.2)
    StdDraw.run

run it:

    ruby examples/example4.rb

![image of example4](https://raw.githubusercontent.com/gregors/standard_draw_tk/master/examples/image_example4.png)




## Installation

Add this line to your application's Gemfile:

```ruby
gem 'standard_draw_tk'
```

And then execute:

    $ bundle

Or install it yourself as:
    $ gem install standard_draw_tk

### Installing TK on Linux

Ruby doesn't contain TK by default anymore. And installing the TK gem requires a bit of manual installation depending on the system. I followed this [blog post](https://saveriomiroddi.github.io/Installing-ruby-tk-bindings-gem-on-ubuntu/) to get it working on linux.

### Installing TK on OSX

* download and install https://www.xquartz.org/ - since TK needs an X11 server
* `brew install tcl-tk`
* `echo 'export PATH="/usr/local/opt/tcl-tk/bin:$PATH"' >> ~/.zshrc`
* `wish` to test it installed correctly
* `rvm install 2.6.5 --enable-shared --enable-pthread --with-tk --with-tcl`
* `gem install tk` should work

## Usage


### Note

You will need to add `StdDraw.run` to the end of your programs as shown in the examples. I may change or alias this in the future or maybe find a work around. This deviates from the original Standar Draw lib

### Points and lines

You can draw points and line segments with the following methods:

    StdDraw.point(x, y)
    StdDraw.line(x1, y1, x2, y2)

The x- and y-coordinates must be in the drawing area (between 0 and 1 and by default) or the points and lines will not be visible.

### Squares, circles, rectangles, and ellipses

You can draw squares, circles, rectangles, and ellipses using the following methods:

    StdDraw.circle(x, y, radius)
    StdDraw.ellipse(x, y, semiMajorAxis, semiMinorAxis)
    StdDraw.square(x, y, radius)
    StdDraw.rectangle(x, y, halfWidth, halfHeight)

All of these methods take as arguments the location and size of the shape. The location is always specified by the x- and y-coordinates of its center. The size of a circle is specified by its radius and the size of an ellipse is specified by the lengths of its semi-major and semi-minor axes. The size of a square or rectangle is specified by its half-width or half-height. The convention for drawing squares and rectangles is parallel to those for drawing circles and ellipses, but may be unexpected to the uninitiated.

The methods above trace outlines of the given shapes. The following methods draw filled versions:

    StdDraw.filledCircle(x, y, radius)
    StdDraw.filledEllipse(x, y, semiMajorAxis, semiMinorAxis)
    StdDraw.filledSquare(x, y, radius)
    StdDraw.filledRectangle(x, y, halfWidth, halfHeight)

### Circular arcs

You can draw circular arcs with the following method:

    StdDraw.arc(x, y, radius, angle1, angle2)

The arc is from the circle centered at (x, y) of the specified radius. The arc extends from angle1 to angle2. By convention, the angles are polar (counterclockwise angle from the x-axis) and represented in degrees. For example, StdDraw.arc(0.0, 0.0, 1.0, 0, 90) draws the arc of the unit circle from 3 o'clock (0 degrees) to 12 o'clock (90 degrees).

### Polygons

You can draw polygons with the following methods:

    StdDraw.polygon([] x, [] y)
    StdDraw.filledPolygon([] x, [] y)

### Colors

You can use the color constants or any [predefined TK Color](https://www.tcl.tk/man/tcl8.5/TkCmd/colors.htm) as a string or symbol as well as hex values

    # are all the same
    StdDraw.pen_color = StdDraw::BLUE
    StdDraw.pen_color = :blue
    StdDraw.pen_color = 'blue'
    StdDraw.pen_color = '#0000FF'

### Examples

see the [examples directory](https://github.com/gregors/standard_draw_tk/tree/master/examples)


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Things to implement:

### line ends bug
* [ ] ends of arcs and line aren't rounded.

### Drawing geometric shapes
* [x] line
* [x] point
* [x] pixel
* [x] rectangle
* [x] filled_rectangle
* [x] polygon
* [x] filled_polygon
* [x] circle
* [x] filled_circle
* [x] ellipse
* [x] filled_ellipse
* [x] arc
* [x] square
* [x] filled_square

### Drawing images

### Drawing text
* [ ] get/set font
* [ ] text centered at x,y
* [ ] text centered at x,y with degree rotation
* [ ] text left aligned x,y
* [ ] text right aligned x,y

### Saving drawing to a file
* [ ] save to jpg

### Mouse interactions

### Keyboard interactions

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gregors/standard_draw_tk.

## License

The gem is available as open source under the terms of the [GNU General Public License, version 3 (GPLv3)](http://www.gnu.org/copyleft/gpl.html).
