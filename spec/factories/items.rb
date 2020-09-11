FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    explanation { Faker::Lorem.paragraph }
    category_id { Faker::Number.between(from: 2, to: 11) }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    shipping_fee_burden_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    days_until_shipping_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9999999) }
    association :user

    #after(:build) do |sample|
      #sample.image.attach(io: File.open('app/assets/images/camera.png'), filename: 'camera.png')
    #end
  end
end
