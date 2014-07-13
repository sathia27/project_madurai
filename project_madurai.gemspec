# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'project_madurai/version'

Gem::Specification.new do |spec|
  spec.name          = "project_madurai"
  spec.version       = ProjectMadurai::VERSION
  spec.authors       = ["sathia27"]
  spec.email         = ["sathia2704@gmail.com"]
  spec.summary       = %q{Cover page generator for project_madurai}
  spec.description   = %q{Extracts title and author from project madurai site and create cover page generator}
  spec.homepage      = ""
  spec.license       = "GPLV3"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "rmagick"
  spec.add_development_dependency "commander"
end
