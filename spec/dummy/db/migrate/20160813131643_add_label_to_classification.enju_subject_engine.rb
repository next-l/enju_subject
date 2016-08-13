# This migration comes from enju_subject_engine (originally 20150925092505)
class AddLabelToClassification < ActiveRecord::Migration
  def change
    add_column :classifications, :label, :string
  end
end
