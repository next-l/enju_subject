require 'rails_helper'

describe Classification do
  #pending "add some examples to (or delete) #{__FILE__}"

end

# == Schema Information
#
# Table name: classifications
#
#  id                     :uuid             not null, primary key
#  parent_id              :integer
#  category               :string           not null
#  note                   :text
#  classification_type_id :integer          not null
#  created_at             :datetime
#  updated_at             :datetime
#  lft                    :integer
#  rgt                    :integer
#  manifestation_id       :integer
#  url                    :string
#  label                  :string
#
