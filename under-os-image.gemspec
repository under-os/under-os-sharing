# -*- encoding: utf-8 -*-
require File.expand_path('../lib/under_os/sharing', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "under-os-sharing"
  gem.version       = UnderOs::Sharing::VERSION

  gem.authors       = ["Nikolay Nemshilov"]
  gem.email         = ['nemshilov@gmail.com']
  gem.description   = "The interapps content sharing API for UnderOS"
  gem.summary       = "The interapps content sharing API for UnderOS"
  gem.license       = 'MIT'

  gem.files         = Dir['lib/**/*']

  gem.add_runtime_dependency 'under-os'#, path: '../under-os'

  gem.add_development_dependency 'rake'
end
