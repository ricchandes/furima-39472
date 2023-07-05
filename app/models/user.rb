class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :sir_name_kanji, presence: true
  validates :last_name_kanji, presence: true
  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/

  with_options presence: true do
    validates :sir_name_kanji, format: { with: VALID_NAME_REGEX, message: '全角で入力してください' }
    validates :last_name_kanji, format: { with: VALID_NAME_REGEX, message: '全角で入力してください' }
  end

  VALID_NAME_REGEX = /\A[ァ-ン]+\z/

  with_options presence: true do
    validates :sir_name_kana, format: { with: VALID_NAME_REGEX, message: 'カタカナで入力してください' }
    validates :last_name_kana, format: { with: VALID_NAME_REGEX, message: 'カタカナで入力してください' }
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: '半角英数を両方含む必要があります' }
  validates :birth_date, presence: true
end
