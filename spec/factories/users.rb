FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    last_name             {person.last.kanji}
    first_name            {person.first.kanji}
    last_name_reading     {person.last.katakana}
    first_name_reading    {person.first.katakana}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65)}
    password              {Faker::Lorem.characters(number: 10, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
  end
end