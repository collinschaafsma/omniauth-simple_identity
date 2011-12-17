# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-simple_identity/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-simple_identity"
  s.version     = Omniauth::SimpleIdentity::VERSION
  s.authors     = ["Collin Schaafsma"]
  s.email       = ["collin@quickleft.com"]
  s.homepage    = "https://github.com/collinschaafsma/omniauth-simple_identity"
  s.summary     = %q{Simplified version of omniauth-identity without the view layer. Ideal for API development.}
  s.description = %q{Simplified version of omniauth-identity without the view layer. Ideal for API development.}

  s.rubyforge_project = "omniauth-simple_identity"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  #
  s.add_runtime_dependency 'omniauth', '~> 1.0'

  s.add_development_dependency 'maruku', '~> 0.6'
  s.add_development_dependency 'simplecov', '~> 0.4'
  s.add_development_dependency 'rack-test', '~> 0.5'
  s.add_development_dependency 'rake', '~> 0.8'
  s.add_development_dependency 'rspec', '~> 2.7'
  s.add_development_dependency 'bcrypt-ruby', '~> 3.0'
  s.add_development_dependency 'activerecord', '~> 3.1'
  s.add_development_dependency 'mongoid'
  s.add_development_dependency 'mongo_mapper'
  s.add_development_dependency 'bson_ext'

end
