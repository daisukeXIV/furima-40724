FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Commerce.material }
    category_id { Faker::Number.between(from: 2, to: 11) }
    condition_1d { Faker::Number.between(from: 2, to: 7) }
    postage_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    delivery_time_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Commerce.price(renge: 300..9_999_999, as_string: false) }
    user_id { Faker::Number.between(from: 1, to: 100) }
  end
end
