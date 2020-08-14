class Shipment < ApplicationRecord
  belongs_to :item, optional: true

  #validates :phone_number, format: { with:/\A0+\d{,10}\z/}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
