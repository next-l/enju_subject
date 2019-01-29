require 'rails_helper'

describe Subject do
  fixtures :subjects

  it "should get term" do
    subjects(:subject_00001).term.should be_truthy
  end
end

# == Schema Information
#
# Table name: subjects
#
#  id                      :bigint(8)        not null, primary key
#  parent_id               :bigint(8)
#  use_term_id             :integer
#  term                    :string
#  term_transcription      :text
#  subject_type_id         :bigint(8)        not null
#  scope_note              :text
#  note                    :text
#  required_role_id        :bigint(8)        default(1), not null
#  lock_version            :integer          default(0), not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  url                     :string
#  manifestation_id        :uuid
#  subject_heading_type_id :bigint(8)
#
