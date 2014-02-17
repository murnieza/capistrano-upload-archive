# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name          = "capistrano-upload-archive"
  gem.version       = "0.0.2"
  gem.authors       = ["Simonas Serlinskas"]
  gem.email         = ["simonas.serlinskas@gmail.com"]
  gem.homepage      = "https://github.com/saimaz/capistrano-upload-archive"
  gem.summary       = %q{Archive upload strategy for Capistrano.}
  gem.description   = %q{Provides an :upload strategy. Sometimes is usefull to sent only archive file to remote server with capistrano.}

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency('capistrano', '>=2.15.0')
end
