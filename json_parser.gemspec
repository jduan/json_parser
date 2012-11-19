# -*- encoding: utf-8 -*-
require File.expand_path('../lib/json_parser/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jingjing Duan"]
  gem.email         = ["jingjing.duan@hulu.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "json_parser"
  gem.require_paths = ["lib"]
  gem.version       = JsonParser::VERSION

  gem.add_development_dependency("rspec", "~> 2.12.0")
end
