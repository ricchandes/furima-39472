class OrderAdress < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :house_number, :building_name, :price, :user_id
end
