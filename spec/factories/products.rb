FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Commerce.material }
    category_id { Faker::Number.between(from: 2, to: 11) }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    postage_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    delivery_time_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
    after(:build) do |product|
      product.image.attach(io: File.open('public/images/testimage.jpg'), filename: 'testimage.jpg')
    end
  end
end
