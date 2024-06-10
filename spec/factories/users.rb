FactoryBot.define do
  factory :user do
    person = Gimei.name

    nickname {Faker::Name.last_name}
    email {Faker::Internet.email}
    password {Faker::Lorem.characters(min_alpha: 1, min_numeric: 1,number:6)}
    password_confirmation {password}
    family_name {person.last.kanji}
    first_name {person.first.kanji}
    family_name_kana{person.last.katakana}
    first_name_kana{person.first.katakana}
    dob {Faker::Date.backward}
  end
end
