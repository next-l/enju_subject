class AddYearOfPublicationToManifestation < ActiveRecord::Migration[5.0]
  def change
    add_column :manifestations, :year_of_publication, :integer
  end
end
