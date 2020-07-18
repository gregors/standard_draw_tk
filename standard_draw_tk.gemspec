
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "standard_draw_tk/version"

Gem::Specification.new do |spec|
  spec.name          = 'standard_draw_tk'
  spec.version       = StandardDrawTk::VERSION
  spec.authors       = ['Gregory Ostermayr']
  spec.email         = ['<gregory.ostermayr@gmail.com>']

  spec.summary       = %q{Ruby TK version of Princeton's Standard Draw}
  spec.description   = %q{Ruby TK version of Princeton's Standard Draw. A basic graphics drawing library.}
  spec.homepage      = 'https://github.com/gregors/standard_draw_tk'
  spec.license       = 'GPLv3'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.require_paths = ["lib"]
  spec.add_dependency 'tk', '~> 0.2.0'
  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
