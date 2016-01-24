class EnjuSubject::SetupGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_setup_files
    directory("db/fixtures", "db/fixtures/enju_subject")
    rake("enju_subject_engine:install:migrations")
    inject_into_file 'app/controllers/application_controller.rb',
      "  include EnjuSubject::Controller\n", after: "EnjuLibrary::Controller\n"
    append_to_file("config/initializers/enju_leaf.rb" do
      <<"EOS"
Manifestation.include(EnjuSubject::EnjuManifestation)
EOS
  end
end
