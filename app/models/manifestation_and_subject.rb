class ManifestationAndSubject < ApplicationRecord
  belongs_to :manifestation
  belongs_to :subject
end

# == Schema Information
#
# Table name: manifestation_and_subjects
#
#  id               :bigint           not null, primary key
#  manifestation_id :bigint           not null
#  subject_id       :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
