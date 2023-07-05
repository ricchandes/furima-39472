class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 validates :nickname,  presence: true
 validates :sir_name_kanji, presence: true
 validates :last_name_kanji, presence: true
 VALID_NAME_REGEX =/\A[ぁ-んァ-ン一-龥]/

with_options presence: true do
validates :sir_name_kanji, format: { with: VALID_NAME_REGEX, message: '全角で入力してください' }
validates :last_name_kanji, format: { with: VALID_NAME_REGEX, message: '全角で入力してください' }
end

VALID_NAME_REGEX = /\A[ァ-ヶー－]+\z/ 

with_options presence: true do
validates :sir_name_kana, format: { with: VALID_NAME_REGEX, message: 'カタカナで入力してください' }
validates :last_name_kana, format: { with: VALID_NAME_REGEX, message: 'カタカナで入力してください' }
end

 validates :birth_date, presence: true
 VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
 validates :password, format: { with: VALID_PASSWORD_REGEX, message: "半角英数を両方含む必要があります"}


end
