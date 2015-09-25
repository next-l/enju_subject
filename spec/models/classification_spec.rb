# -*- encoding: utf-8 -*-
require 'spec_helper'

describe Classification do
  fixtures :classifications

  it "should not create duplicate category" do
    classification = Classification.create(category: '000', classification_type_id: 1)
    classification.should_not be_valid
  end
end

# == Schema Information
#
# Table name: classifications
#
#  id                     :integer          not null, primary key
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
#
