class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price, numericality:
      { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
  end

  with_options numericality: { message: 'select' } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :shipping_origin_id
    validates :shipping_date_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :shipping_date
end
