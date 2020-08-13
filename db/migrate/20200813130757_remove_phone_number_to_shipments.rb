class RemovePhoneNumberToShipments < ActiveRecord::Migration[6.0]
  def change
    remove_column :shipments, :phone_number, :integer
  end
end
