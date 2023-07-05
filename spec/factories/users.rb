FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    sir_name_kanji {"山田"}
    last_name_kanji  {"陸太郎"}
    sir_name_kana     {"ヤマダ"} 
    last_name_kana     {"リクタロウ"} 
    birth_date {"2000-01-01"}
    
  end
end
