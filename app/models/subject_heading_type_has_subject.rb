class SubjectHeadingTypeHasSubject < ActiveRecord::Base
  attr_accessible :subject_id, :subject_heading_type_id
  belongs_to :subject #, :polymorphic => true
  belongs_to :subject_heading_type

  validates_presence_of :subject, :subject_heading_type
  validates_associated :subject, :subject_heading_type
  validates_uniqueness_of :subject_id, :scope => :subject_heading_type_id
end

# == Schema Information
#
# Table name: subject_heading_type_has_subjects
#
#  id                      :integer          not null, primary key
#  subject_id              :integer          not null
#  subject_type            :string(255)
#  subject_heading_type_id :integer          not null
#  created_at              :datetime
#  updated_at              :datetime
#

