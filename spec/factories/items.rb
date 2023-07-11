FactoryBot.define do
  factory :item do
   name {Faker::Name.last_name}
   explanation{Faker::Lorem.sentence}
    image {Faker::Lorem.sentence}    
  end
end


