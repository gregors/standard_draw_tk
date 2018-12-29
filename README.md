# Standard Draw TK

I was going through the [Algorithms 4th edition](https://algs4.cs.princeton.edu/home/) and wanted to write the algorithms in ruby instead of the default java. The book uses the [Princeton Standard Libraries](https://introcs.cs.princeton.edu/java/stdlib/) to help clarify the code.

I really would like to call this code in standard ruby. So I'm attempting to keep the original interface while recreating the logic using the [ruby TK gem](https://github.com/ruby/tk). The graphics drawing portion works but the library is not yet fully complete.

If you need something not yet ported consider using the [jruby wrapper gem](https://rubygems.org/gems/princeton_standard_libraries) that lets you call the original java code in Jruby.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'standard_draw_tk'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install standard_draw_tk
Ruby doesn't contain TK by default anymore. And installing the TK gem requires a bit of manual installation depending on the system. I followed this [blog post](https://saveriomiroddi.github.io/Installing-ruby-tk-bindings-gem-on-ubuntu/) to get it working on linux.

## Usage

The drawing of geometric shapes has been implemented though there are probably some small tweaks that need to be added, e.g. the line ends of arcs.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Things to implement:

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
