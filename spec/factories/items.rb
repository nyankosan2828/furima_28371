FactoryBot.define do
  factory :item do
    #image { fixture_file_upload('https://unsplash.it/500/500?random') }
    name { Faker::Name.name }
    explanation { Faker::String.random(length: [1,1000]) }
    price { Faker::Number.between(from: 300, to: 9999999) }
    category_id { Faker::Number.between(from: 1, to: 10) }
    status_id { Faker::Number.between(from: 1, to: 6) }
    shipping_fee_id { Faker::Number.between(from: 1, to: 2) }
    shipping_origin_id { Faker::Number.between(from: 1, to: 47) }
    shipping_date_id { Faker::Number.between(from: 1, to: 3) }
  end
end
