class PurchaseShipment
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street_number, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
    validates :city
    validates :street_number
    validates :phone_number, length: { maximum: 11 }
  end

  validates :prefecture_id, numericality: { message: 'select' }

  def save
    Purchase.create(user_id: user_id, item_id: item_id)
    Shipment.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_number: street_number, building_name: building_name, phone_number: phone_number, item_id: item_id)
  end
end
