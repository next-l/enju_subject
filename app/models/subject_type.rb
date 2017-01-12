class SubjectType < ActiveRecord::Base
  include MasterModel
  default_scope { order("subject_types.position") }
  has_many :subjects
  validates :name, format: {with: /\A[0-9A-Za-z][0-9a-z_\-]*[0-9a-z]\Z/}
end

# == Schema Information
#
# Table name: subject_types
#
#  id                        :integer          not null, primary key
#  name                      :string           not null
#  display_name_translations :jsonb
#  note                      :text
#  position                  :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
