# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'top_recipes/version'

Gem::Specification.new do |spec|
  spec.name          = "top-recipes"
  spec.version       = TopRecipes::VERSION
  spec.authors       = ["mxdavis"]
  spec.email         = ["md01@me.com"]
  spec.summary       = %q{Top trending recipes from http://food2fork.com/}
  spec.description   = %q{Top trending recipes from http://food2fork.com/}
  spec.homepage      = "https://github.com/mxdavis/recipes-from-food2fork-cli"

  spec.files         = `git ls-files`.split($\)
  spec.executables   = ["top-recipes"]
  spec.require_paths = ["lib" "lib/top_recipes"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
end
