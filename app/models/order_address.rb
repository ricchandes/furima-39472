class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :address, :building, :tell, :token, :item_id, :order_id, :user_id

  with_options presence: true do   #order_paramsのvalidation
    validates :user_id
    validates :item_id
    validates :address
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :tell, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid. Exclude hyphen(-)"}
    validates :city
  end

  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
  order = Order.create(item_id: item_id, user_id: user_id)
  Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, address: address, building: building, tell: tell, order_id: order.id)
  end
end
