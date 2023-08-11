FactoryBot.define do
  factory :item do
    name                 {Faker::Name.name}
    details              {Faker::Lorem.sentence}
    category_id          {Faker::Number.between(from: 2, to: 11)}
    condition_id         {Faker::Number.between(from: 2, to: 7)}
    shipping_fee_id      {Faker::Number.between(from: 2, to: 3)}
    shipping_day_id      {Faker::Number.between(from: 2, to: 4)}
    prefecture_id        {Faker::Number.between(from: 2, to: 48)}
    price                {9999}

    association :user 
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
  
end
