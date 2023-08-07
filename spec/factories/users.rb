FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    last_name             {'田中'}
    first_name            {'佑介'}
    last_name_reading     {'タナカ'}
    first_name_reading    {'ユウスケ'}
    birthday              {'1993-09-03'}
    password              {'000000'}
    password_confirmation {password}
  end
end