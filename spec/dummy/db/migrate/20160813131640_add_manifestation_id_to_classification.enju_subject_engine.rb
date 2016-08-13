# This migration comes from enju_subject_engine (originally 20130504143515)
class AddManifestationIdToClassification < ActiveRecord::Migration
  def change
    add_column :classifications, :manifestation_id, :integer
    add_index :classifications, :manifestation_id
  end
end
