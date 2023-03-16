FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}

    transient do
      person { Gimei.name }
    end
    first_name            { person.first }
    last_name             { person.last }
    first_name_reading    { person.first.katakana }
    last_name_reading     { person.last.katakana }
    birthday              { Faker::Date.backward }
  end
end