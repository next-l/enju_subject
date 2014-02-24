class Classification < ActiveRecord::Base
  #attr_accessible :parent_id, :category, :note, :classification_type_id
  belongs_to :classification_type
  belongs_to :manifestation

  validates_associated :classification_type
  validates_presence_of :category, :classification_type
  searchable do
    text :category, :note
    integer :classification_type_id
  end
  normalize_attributes :category

  paginates_per 10
end

# == Schema Information
#
# Table name: classifications
#
#  id                     :integer          not null, primary key
#  parent_id              :integer
#  category               :string(255)      not null
#  note                   :text
#  classification_type_id :integer          not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  lft                    :integer
#  rgt                    :integer
#  manifestation_id       :integer
#

