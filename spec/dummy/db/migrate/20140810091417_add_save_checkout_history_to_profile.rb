class AddSaveCheckoutHistoryToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :save_checkout_history, :boolean, default: false, null: false
  end
end