FactoryBot.define do
  factory :purchase_address do
    postal_code          {"480-1234"}
    prefecture_id        {Faker::Number.between(from: 2, to: 48)}
    city                 {"名古屋市"}
    house_number         {"武田2-190"}
    phone_number         {"09012345678"}
    token                {"tok_abcdefghijk00000000000000000"}
  end
end