class Subject < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  belongs_to :manifestation
  belongs_to :subject_type
  belongs_to :subject_heading_type
  belongs_to :required_role, :class_name => 'Role', :foreign_key => 'required_role_id'

  validates_associated :subject_type, :subject_heading_type
  validates_presence_of :term, :subject_type_id, :subject_heading_type_id

  index_name "#{name.downcase.pluralize}-#{Rails.env}"

  after_commit on: :create do
    index_document
  end

  after_commit on: :update do
    update_document
  end

  after_commit on: :destroy do
    delete_document
  end

  settings do
    mappings dynamic: 'false', _routing: {required: true, path: :required_role_id} do
      indexes :term
      indexes :created_at, type: 'date'
    end
  end

  normalize_attributes :term

  paginates_per 10
end

# == Schema Information
#
# Table name: subjects
#
#  id                      :integer          not null, primary key
#  parent_id               :integer
#  use_term_id             :integer
#  term                    :string(255)
#  term_transcription      :text
#  subject_type_id         :integer          not null
#  scope_note              :text
#  note                    :text
#  required_role_id        :integer          default(1), not null
#  lock_version            :integer          default(0), not null
#  created_at              :datetime
#  updated_at              :datetime
#  deleted_at              :datetime
#  url                     :string(255)
#  manifestation_id        :integer
#  subject_heading_type_id :integer
#

