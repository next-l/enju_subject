module EnjuSubject
  module ManifestationsController
    extend ActiveSupport::Concern

    included do
      before_action :get_subject, except: [:create, :update, :destroy]

      private

      def prepare_options
        @carrier_types = CarrierType.select([:id, :display_name_translations, :position])
        @content_types = ContentType.select([:id, :display_name_translations, :position])
        @roles = Role.select([:id, :display_name_translations, :position])
        @languages = Language.select([:id, :display_name, :position])
        @frequencies = Frequency.select([:id, :display_name_translations, :position])
        @identifier_types = IdentifierType.select([:id, :display_name, :position])
        @nii_types = NiiType.select([:id, :display_name, :position]) if defined?(EnjuNii)
        @subject_types = SubjectType.select([:id, :display_name, :position])
        @subject_heading_types = SubjectHeadingType.select([:id, :display_name, :position])
        @classification_types = ClassificationType.select([:id, :display_name, :position])
      end
    end
  end
end
