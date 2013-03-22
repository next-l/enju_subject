module EnjuSubject
  module EnjuManifestation
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def enju_subject_model
        include InstanceMethods
        attr_accessible :ndc, :classification_number
        has_many :work_has_subjects, :foreign_key => 'work_id', :dependent => :destroy
        has_many :subjects, :through => :work_has_subjects

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

    module InstanceMethods
      def classifications
        subjects.collect(&:classifications).flatten
      end
    end
  end
end
