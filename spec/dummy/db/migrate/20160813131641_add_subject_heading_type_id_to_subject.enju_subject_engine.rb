# This migration comes from enju_subject_engine (originally 20130504195916)
class AddSubjectHeadingTypeIdToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :subject_heading_type_id, :integer
  end
end
