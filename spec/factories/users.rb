FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name_kanji { 'あキ田' }
    first_name_kanji { 'あキ子' }
    family_name_kana { 'アキタ' }
    first_name_kana { 'アキコ' }
    birth_day { Faker::Date.birthday }
  end
end
