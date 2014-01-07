# -*- encoding: utf-8 -*-
require File.expand_path('../lib/under_os/sharing', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "under-os-sharing"
  gem.version       = UnderOs::Sharing::VERSION
  gem.homepage      = "http://under-os.com"
  gem.summary       = "The interapps content sharing API for UnderOS"
  gem.description   = "The interapps content sharing API for UnderOS. FTW"

  gem.authors       = ["Nikolay Nemshilov"]
  gem.email         = ['nemshilov@gmail.com']
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})

  gem.add_runtime_dependency 'under-os', '~> 0'#, path: '../under-os'

  gem.add_development_dependency 'rake', '~> 0'
end
