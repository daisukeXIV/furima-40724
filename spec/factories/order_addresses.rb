FactoryBot.define do
  factory :order_address do
    address = Gimei.address
    tell_num_coount = Faker::Number.between(from: 10, to: 11)
    post_code { Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    municipality { address.city.kanji }
    street_address { Faker::Address.building_number }
    building { Faker::Company.name }
    tell { Faker::Number.leading_zero_number(digits: tell_num_coount) }
    token { Faker::Alphanumeric.alphanumeric(number: 30) }
  end
end
