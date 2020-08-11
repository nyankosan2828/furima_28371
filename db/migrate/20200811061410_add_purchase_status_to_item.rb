class AddPurchaseStatusToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :purchase_status, :boolean, default: false, null: false
  end
end
