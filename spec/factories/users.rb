FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    first_name { 'テスト山田です' }
    last_name { 'テスト太郎です' }
    first_name_kana { 'テストヤマダデス' }
    last_name_kana { 'テストタロウデス' }
    birth_day { Faker::Date.birthday }
  end
end
