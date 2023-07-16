FactoryBot.define do
  factory :order do
    id         {1}
    association :user
    association :item
  end
end
