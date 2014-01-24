# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'duolingo/version'

Gem::Specification.new do |spec|
  spec.name          = "duolingo"
  spec.version       = Duolingo::VERSION
  spec.authors       = ["Adam89"]
  spec.email         = ["Adam.dev89@gmail.com"]
  spec.summary       = %q{wrapper gem for duolingo api}
  spec.description   = %q{A gem that allows interaction with duolingos api.}
  spec.homepage      = "https://github.com/Adam89/duolingo"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "webmock"
  spec.add_dependency "faraday"
  spec.add_dependency "hashie"
end
