# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'roll/amp/version'

Gem::Specification.new do |spec|
  spec.name          = 'roll-amp'
  spec.version       = Roll::Amp::VERSION
  spec.authors       = ['Viacheslav Shynkarenko']
  spec.email         = ['shinkarenko.vi@gmail.com']

  spec.summary       = 'AMP in Rails apps'
  spec.description   = 'Utilities to simplify Accelerated Mobile Pages (AMP)'\
                       ' implementation in Rails apps'
  spec.homepage      = 'https://github.com/roll-rails/roll-amp'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version     = '>= 2.2.6'
  spec.required_rubygems_version = '>= 1.8.11'

  spec.add_dependency 'actionview', '>= 3.2.0', '<= 5.1.0'
  spec.add_dependency 'railties', '>= 3.2.0', '<= 5.1.0'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 1.0.0'
  spec.add_development_dependency 'rspec-html-matchers', '~> 0.9.1'
end
