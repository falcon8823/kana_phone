# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kana_phone'

Gem::Specification.new do |spec|
  spec.name          = "kana-phone"
  spec.version       = KanaPhone::VERSION
  spec.authors       = ["Hayato OKUMOTO"]
  spec.email         = ["falcon@falconsrv.net"]
  spec.summary       = %q{Translate from hiragana to phone expression.}
  spec.description   = %q{Translate from hiragana to phone expression.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 2.14"
  spec.add_development_dependency "pry", [">= 0"]
  spec.add_development_dependency "guard", ">= 2.3"
  spec.add_development_dependency "guard-rspec", ">= 4.2"
end
