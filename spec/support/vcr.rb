require 'vcr'

RSpec.configure do |config|
  config.extend VCR::RSpec::Macros
end

VCR.configure do |c|
  c.cassette_library_dir     = 'spec/cassette_library'
  c.hook_into                :fakeweb
  c.default_cassette_options = { :record => :new_episodes }
end
