# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'roll/amp/version'

Gem::Specification.new do |spec|
  spec.name          = 'roll-amp'
  spec.version       = Roll::Amp::VERSION
  spec.authors       = ['Viacheslav Shynkarenko']
  spec.email         = ['shinkarenko.vi@gmail.com']

  spec.summary       = 'APIs to simplify AMP implementation in Rails app'
  spec.description   = 'This gem is intended to contain any helpful API' \
                       'related to Accelerated Mobile Pages (AMP).'
  spec.homepage      = 'https://github.com/slavikdev/roll-amp'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
