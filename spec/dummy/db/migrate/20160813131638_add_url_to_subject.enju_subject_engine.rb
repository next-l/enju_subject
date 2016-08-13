# This migration comes from enju_subject_engine (originally 20120406020752)
class AddUrlToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :url, :string
  end
end
