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
#  id                      :uuid             not null, primary key
#  parent_id               :integer
#  use_term_id             :integer
#  term                    :string
#  term_transcription      :text
#  subject_type_id         :integer          not null
#  scope_note              :text
#  note                    :text
#  required_role_id        :integer          default(1), not null
#  lock_version            :integer          default(0), not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  deleted_at              :datetime
#  url                     :string
#  manifestation_id        :integer
#  subject_heading_type_id :integer
#
