require "rails_helper.rb"
require "generator_spec"
require 'generator_spec/test_case'
require 'generators/enju_subject/setup/setup_generator'

describe EnjuSubject::SetupGenerator, type: :generator do
  destination File.expand_path("tmp", Rails.root)
  before(:each) do
    prepare_destination
    %w( app/controllers/application_controller.rb app/models/user.rb ).each do |f|
      dist_file = "#{Rails.root}/tmp/#{f}"
      dist_dir = File.dirname(dist_file)
      mkdir_p dist_dir
      touch dist_file
    end
    run_generator
  end

  it "does work" do
    expect(destination_root).to have_structure {
      directory "app" do
        directory "models" do
          file "user.rb" do
            contains "Manifestation.include(EnjuSubject::EnjuManifestation)"
          end
        end
        directory "controllers" do
          file "application_controller.rb"
        end
      end
    }
  end
end
