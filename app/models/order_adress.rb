class OrderAdress < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :address, :building, :tell, :user_id, :order_id, :address_id, :token

  with_options presence: true do
    validates :user_id
    validates :order_id
    validates :address_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :tell, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid. Exclude hyphen(-)"}
    validates :city
    validates :address


  end

  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(order_id: order_id, user_id: user_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, address: address, building: building, tell: tell, order: order)
  end

end
