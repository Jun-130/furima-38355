FactoryBot.define do
  factory :user do
    nickname        { Faker::Name.name }
    last_name       { Gimei.last.kanji }
    first_name      { Gimei.first.hiragana }
    kana_last_name  { Gimei.last.katakana }
    kana_first_name { Gimei.first.katakana }
    birth_date      { Faker::Date.backward }
    email           { Faker::Internet.free_email }
    password        { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end
