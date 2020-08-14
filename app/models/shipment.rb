class Shipment < ApplicationRecord
  belongs_to :item, optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
