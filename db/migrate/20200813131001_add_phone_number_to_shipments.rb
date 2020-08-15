class AddPhoneNumberToShipments < ActiveRecord::Migration[6.0]
  def change
    add_column :shipments, :phone_number, :string
  end
end
