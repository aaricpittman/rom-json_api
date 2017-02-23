# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rom/json_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'rom-json_api'
  spec.version       = Rom::JsonApi::VERSION
  spec.authors       = ['Andy Holland']
  spec.email         = ['andyholland1991@aol.com']

  spec.summary       = %q{JSON API adapter for Ruby Object Mapper}
  spec.description   = %q{JSON API adapter for Ruby Object Mapper}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0") - ['bin/console']
  spec.executables   = []
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # spec.add_runtime_dependency 'rom-http'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
