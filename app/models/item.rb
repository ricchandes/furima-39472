class Item < ApplicationRecord
  validates :name, presence: true
  validates :image, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :status_id, presence: true
  validates :delivery_price_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_date_id, presence: true
  validates :price, presence: true


  belongs_to :user

end
