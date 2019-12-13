require_dependency EnjuBiblio::Engine.config.root.join('app', 'controllers', 'manifestations_controller.rb').to_s

class ManifestationsController < ApplicationController
  include EnjuSubject::ManifestationsController
end
