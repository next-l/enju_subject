$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "enju_subject/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "enju_subject"
  s.version     = EnjuSubject::VERSION
  s.authors     = ["Kosuke Tanabe"]
  s.email       = ["nabeta@fastmail.fm"]
  s.homepage    = "https://github.com/next-l/enju_subject"
  s.summary     = "enju_subject plugin"
  s.description = "Subject and classification management for Next-L Enju"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"] - Dir["spec/dummy/log/*"] - Dir["spec/dummy/solr/{data,pids}/*"]

  s.add_dependency "enju_seed", "~> 0.2.0.pre6"
  s.add_dependency "dynamic_form"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 3.0"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "vcr", "~> 2.9"
  #s.add_development_dependency "enju_leaf", "~> 1.2.0.pre1"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "elasticsearch-extensions"
  s.add_development_dependency "annotate"
end
