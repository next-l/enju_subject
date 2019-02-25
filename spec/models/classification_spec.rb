require 'rails_helper'

describe Classification do
  #pending "add some examples to (or delete) #{__FILE__}"

end

# == Schema Information
#
# Table name: classifications
#
#  id                     :uuid             not null, primary key
#  parent_id              :uuid
#  category               :string           not null
#  note                   :text
#  classification_type_id :bigint(8)        not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  lft                    :integer
#  rgt                    :integer
#  manifestation_id       :uuid
#  url                    :string
#  label                  :string
#
