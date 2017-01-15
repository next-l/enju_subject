class ClassificationType < ActiveRecord::Base
  include MasterModel
  has_many :classifications
  validates :name, format: { with: /\A[0-9a-z][0-9a-z_\-]*[0-9a-z]\Z/ }
  translates :display_name
end

# == Schema Information
#
# Table name: classification_types
#
#  id                        :integer          not null, primary key
#  name                      :string           not null
#  display_name_translations :jsonb
#  note                      :text
#  position                  :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
