FactoryBot.define do
  factory :order_address do
    postcode       { '123-4567' }
    prefecture_id  { '3' }
    city           { '東京都' }
    address        { '新宿区3-8-9' }
    building       { 'TKビル' }
    tell           { '09011112222' }
    token          {"tok_abcdefghijk00000000000000000"}

  end
end
