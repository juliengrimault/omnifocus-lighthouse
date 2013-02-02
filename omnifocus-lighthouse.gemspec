# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omnifocus-lighthouse/version'

Gem::Specification.new do |gem|
  gem.name          = "omnifocus-lighthouse"
  gem.version       = Omnifocus::Lighthouse::VERSION
  gem.authors       = ["Julien Grimault"]
  gem.email         = ["grimaultjulien@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "omnifocus", ~> '2.1.1'
  gem.add_dependency "lighthouse-api", ~> '2.0'
end
