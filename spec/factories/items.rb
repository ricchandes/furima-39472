FactoryBot.define do
  factory :item do
    name { Faker::Name.last_name }
    explanation       { Faker::Lorem.sentence }
    category_id       { 2 }
    status_id         { 2 }
    delivery_price_id { 2 }
    prefecture_id     { 2 }
    delivery_date_id  { 2 }
    price             { 1500 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
