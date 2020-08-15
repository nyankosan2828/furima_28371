FactoryBot.define do
  factory :item do
    name { 'testアイテム' }
    explanation { 'testです' }
    price { 9_999_999 }
    category_id { 1 }
    status_id { 1 }
    shipping_fee_id { 1 }
    prefecture_id { 1 }
    shipping_date_id { 1 }
    association :user
  end
end
