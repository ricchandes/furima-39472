class Item < ApplicationRecord
  validates :name, presence: true
  validates :image, presence: true
  validates :explanation, presence: true
  validates :category_id,                     numericality:{ other_than: 1, message: "を入力してください" }
  validates :status_id,                       numericality:{ other_than: 1, message: "を入力してください" }
  validates :delivery_price_id,               numericality:{ other_than: 1, message: "を入力してください" }
  validates :prefecture_id,                   numericality:{ other_than: 1, message: "を入力してください" }
  validates :delivery_date_id,                numericality:{ other_than: 1, message: "を入力してください" }
  with_options presence: true, format:{ with: /\A[0-9]+\z/ } do
    validates :price,                         numericality:{ only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                                              presence:{ message: "を入力してください" }
  end
  belongs_to :user
  has_one_attached :image
  has_one :order
  has_many :likes
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :prefecture
  belongs_to :delivery_price
  belongs_to :delivery_date
end
