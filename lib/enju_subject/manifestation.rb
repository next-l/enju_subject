module EnjuSubject
  module EnjuManifestation
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def enju_subject_manifestation_model
        include InstanceMethods
        attr_accessible :subjects_attributes, :classifications_attributes
        has_many :subjects
        has_many :classifications
        accepts_nested_attributes_for :subjects, :allow_destroy => true, :reject_if => :all_blank
        accepts_nested_attributes_for :classifications, :allow_destroy => true, :reject_if => :all_blank

        searchable do
          text :subject do
            subjects.map{|s| [s.term, s.term_transcription]}.flatten.compact
          end
          string :subject, :multiple => true do
            subjects.map{|s| [s.term, s.term_transcription]}.flatten.compact
          end
          string :classification, :multiple => true do
            classifications.collect(&:category)
          end
          integer :subject_ids, :multiple => true
        end
      end
    end
  end
end
