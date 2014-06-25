module EnjuSubject
  module EnjuManifestation
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def enju_subject_manifestation_model
        include InstanceMethods
        #attr_accessible :subjects_attributes, :classifications_attributes
        has_many :subjects
        has_many :classifications
        accepts_nested_attributes_for :subjects, :allow_destroy => true, :reject_if => :all_blank
        accepts_nested_attributes_for :classifications, :allow_destroy => true, :reject_if => :all_blank

        settings do
          mappings dynamic: 'false', _routing: {required: false} do
            indexes :subject
            indexes :classification
            indexes :subject_ids, type: 'integer'
          end
        end
        #attr_accessible :item_has_use_restriction_attributes
      end
    end

    module InstanceMethods
      def as_indexed_json(options={})
        super.merge(
          subject: subjects.map{|s| [s.term, s.term_transcription]}.flatten.compact,
          classification: classifications.collect(&:category),
          subject_ids: subject_ids
        )
      end
    end
  end
end
