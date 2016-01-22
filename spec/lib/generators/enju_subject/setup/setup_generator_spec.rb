require "spec_helper.rb"
require "generator_spec"
require 'generator_spec/test_case'
require 'generators/enju_subject/setup/setup_generator'

describe EnjuSubject::SetupGenerator, type: :generator do
  destination File.expand_path("tmp", Rails.root)
  before(:each) do
    prepare_destination
    %w( app/controllers/application_controller.rb config/initializers/enju_leaf.rb ).each do |f|
      dist_file = "#{Rails.root}/tmp/#{f}"
      dist_dir = File.dirname(dist_file)
      mkdir_p dist_dir
      touch dist_file
    end
    run_generator
  end
  it "does work" do
  end
end
