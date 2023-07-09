class Item < ApplicationRecord
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :delivery_price_id,numericality: { other_than: 1, message: "can't be blank" } 
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :delivery_date_id, numericality: { other_than: 1, message: "can't be blank" } 
  VALID_PRICE_REGEX = /\A[0-9]+\z
  validates :price, format: { with: VALID_PRICE_REGEX, message: '半角数字で入力する必要があります' }
  has_one_attached :image


  belongs_to :user

end
