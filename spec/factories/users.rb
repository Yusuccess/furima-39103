FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    last_name             {'田中'}
    first_name            {'佑介'}
    last_name_reading     {'タナカ'}
    first_name_reading    {'ユウスケ'}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65)}
    password              {Faker::Lorem.characters(number: 10, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}


  end
end