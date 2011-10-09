class Manifestation < ActiveRecord::Base
  has_many :work_has_subjects, :foreign_key => 'work_id', :dependent => :destroy
  has_many :subjects, :through => :work_has_subjects

  searchable do
    text :subject do
      subjects.collect(&:term) + subjects.collect(&:term_transcription)
    end
    string :subject, :multiple => true do
      subjects.collect(&:term) + subjects.collect(&:term_transcription)
    end
    string :classification, :multiple => true do
      classifications.collect(&:category)
    end
    integer :subject_ids, :multiple => true
  end

  def classifications
    subjects.collect(&:classifications).flatten
  end
end
