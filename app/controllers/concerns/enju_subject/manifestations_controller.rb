module EnjuSubject
  module ManifestationsController
    extend ActiveSupport::Concern

    included do
      before_action :get_subject, except: [:create, :update, :destroy]
    end

    private
    def prepare_options
      @subject_types = SubjectType.select([:id, :display_name, :position])
      @subject_heading_types = SubjectHeadingType.select([:id, :display_name, :position])
      @classification_types = ClassificationType.select([:id, :display_name, :position])
      super
    end
  end
end
