class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    if @item.order.nil? && current_user.id != @item.user.id
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      @order_address = OrderAddress.new
    else
      redirect_to root_path
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postcode, :prefecture_id, :city, :address, :building, :tell).merge(
      token: params[:token], user_id: current_user.id, item_id: params[:item_id]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card:   order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
