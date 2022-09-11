FactoryBot.define do
  factory :order_address do
    zip_code      { Faker::Number.number(digits: 7).to_s.insert(3, '-') }
    prefecture_id { Prefecture.all.sample }
    city          { Faker::Address.city }
    street        { Faker::Address.street_address }
    building      { Faker::Address.building_number }
    phone_number  { Faker::Number.leading_zero_number(digits: 10) }
    token         { "tok_abcdefghijk00000000000000000" }
  end
end
