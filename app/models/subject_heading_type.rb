class SubjectHeadingType < ActiveRecord::Base
  attr_accessible :name, :display_name, :note
  include MasterModel
  default_scope { order("subject_heading_types.position") }
  has_many :subjects
  validates :name, format: {with: /\A[0-9a-z][0-9a-z_\-]*[0-9a-z]\Z/}
end

# == Schema Information
#
# Table name: subject_heading_types
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  display_name :text
#  note         :text
#  position     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

