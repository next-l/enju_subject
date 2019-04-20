class Classification < ActiveRecord::Base
  belongs_to :classification_type
  belongs_to :manifestation, touch: true, optional: true

  validates_associated :classification_type
  validates_presence_of :category, :classification_type
  searchable do
    text :category, :note
    integer :classification_type_id
  end
  strip_attributes only: [:category, :url]

  paginates_per 10
end

# == Schema Information
#
# Table name: classifications
#
#  id                     :bigint(8)        not null, primary key
#  parent_id              :bigint(8)
#  category               :string           not null
#  note                   :text
#  classification_type_id :bigint(8)        not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  lft                    :integer
#  rgt                    :integer
#  manifestation_id       :bigint(8)
#  url                    :string
#  label                  :string
#
