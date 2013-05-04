class WorkHasSubject < ActiveRecord::Base
  attr_accessible :subject_id, :work_id, :position
  belongs_to :subject
  belongs_to :work, :class_name => 'Manifestation'

  validates_presence_of :work, :subject #, :subject_type
  validates_associated :work, :subject
  validates_uniqueness_of :subject_id, :scope => :work_id
  after_save :reindex
  after_destroy :reindex

  acts_as_list :scope => :work_id

  def reindex
    work.try(:index)
    subject.try(:index)
  end
end

# == Schema Information
#
# Table name: work_has_subjects
#
#  id           :integer          not null, primary key
#  subject_id   :integer
#  subject_type :string(255)
#  work_id      :integer
#  position     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

