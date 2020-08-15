class CreateShipments < ActiveRecord::Migration[6.0]
  def change
    create_table :shipments do |t|
      t.string :postal_code,    null: false
      t.integer :prefecture_id, null: false
      t.string :city,           null: false
      t.string :street_number
      t.string :building_name,  null: false
      t.integer :phone_number,  null: false
      t.references :item,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
