FactoryBot.define do
  factory :item do
    name        { Faker::Lorem.sentences }
    description { Faker::Lorem.sentences }
    price       { Faker::Number.between(from: 300, to: 9_999_999) }
    category        { Category.all.sample }
    condition       { Condition.all.sample }
    shipping_charge { ShippingCharge.all.sample }
    prefecture      { Prefecture.all.sample }
    shipping_day    { ShippingDay.all.sample }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
