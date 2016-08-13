# This migration comes from enju_subject_engine (originally 20130504133816)
class AddManifestationIdToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :manifestation_id, :integer
    add_index :subjects, :manifestation_id
  end
end
