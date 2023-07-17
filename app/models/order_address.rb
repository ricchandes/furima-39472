class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :address, :building, :tell, :token, :item_id, :order_id, :user_id

  with_options presence: true do   # order_paramsのvalidation
    validates :user_id
    validates :item_id
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :tell,     format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid. ハイフン(-)をのぞいた半角数字で入力してください' }
    validates :city
    validates :address
    validates :token, presence: true
    end
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(item_id:, user_id:)
    Address.create(postcode:, prefecture_id:, city:, address:, building:, tell:,
                   order_id: order.id)
  end
end
