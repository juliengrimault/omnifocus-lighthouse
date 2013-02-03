# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omnifocus/lighthouse/version'
#require File.expand_path('../lib/omnifocus/lighthouse/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "omnifocus-lighthouse"
  gem.authors       = ["Julien Grimault"]
  gem.email         = ["grimaultjulien@gmail.com"]
  gem.description   = %q{Plugin for omnifocus gem to provide Ligthouse BTS synchronization.}

  gem.summary       = %q{Plugin for omnifocus gem to provide Ligthouse BTS synchronization.}

  gem.homepage      = "https://github.com/juliengrimault/omnifocus-lighthouse"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.version       = OmniFocus::Lighthouse::VERSION

  gem.add_dependency "omnifocus", '~> 2.1.1'
  gem.add_dependency "lighthouse-api", '~> 2.0'
end
