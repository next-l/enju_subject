$:.push File.expand_path("lib", __dir__)

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

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"] - Dir["spec/dummy/{log,private,solr,tmp,node_modules}/**/*"] - Dir["spec/dummy/public/packs*/**/*"]

  s.add_dependency "enju_biblio", "~> 0.5.0.beta.1"

  s.add_development_dependency "enju_leaf", "~> 3.0.0.beta.1"
  s.add_development_dependency "pg"
  s.add_development_dependency "rspec-rails", "~> 5.0"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "factory_bot_rails"
  s.add_development_dependency "sunspot_solr", "~> 2.5"
  s.add_development_dependency "coveralls", '~> 0.8.23'
  s.add_development_dependency "annotate"
  s.add_development_dependency "brakeman"
end
