FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'o2' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { person.first.kanji }
    last_name             { person.last.kanji }
    first_name_reading    { person.first.katakana }
    last_name_reading     { person.last.katakana }
    birthday              { Faker::Date.backward }
  end
end
