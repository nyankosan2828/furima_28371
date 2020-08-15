FactoryBot.define do
  factory :purchase_shipment do
    postal_code { '123-4567' }
    prefecture_id { 27 }
    city { '大阪市' }
    street_number { '中央区難波5丁目1-60' }
    building_name { 'なんばスカイオ' }
    phone_number { '09012345678' }
  end
end