# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'matchdoc/version'

Gem::Specification.new do |spec|
  spec.name          = "matchdoc"
  spec.version       = Matchdoc::VERSION
  spec.authors       = ["Stephen Prater"]
  spec.email         = ["me@stephenprater.com"]
  spec.summary       = %q{Match long strings against templates with dynamic areas.}
  spec.description   = %q{For longer strings it's not always possible or desirable to know 
                          the exact output of the string - you might know that every line in
                          a file shoudld contain a price, but not what that price will be.
                          This provides an RSpec matcher for that exact problem.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
end
