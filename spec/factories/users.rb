FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 6)}
    email                 {Faker::Internet.free_email}
    last_name             {'田中'}
    first_name            {'佑介'}
    last_name_reading     {'タナカ'}
    first_name_reading    {'ユウスケ'}
    birthday              {'1993-09-03'}
    password {Faker::Internet.password(min_length: 6)}
    #password              {Faker::Lorem.characters(min_length:6, max_length: 128, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}


  end
end