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
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "json", "~> 1.8"
  spec.add_development_dependency "vcr", "~> 2.9"
  spec.add_development_dependency "pry", "~> 0.9"
  spec.add_development_dependency "rack-test", "~> 1.5"
  spec.add_development_dependency "simplecov", "~> 0.8"
  spec.add_development_dependency "webmock", "~> 1.18"
  spec.add_development_dependency "faraday", "~> 0.9"
  spec.add_development_dependency "hashie", "~> 2.1"
end
