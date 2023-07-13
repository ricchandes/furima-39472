class AddressController < ApplicationController
  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(address_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity  
    end
  end

  private

  def address_params
    params.require(:order_address).permit(:postcode, :prefecture_id, :city, :address, :building, :tell).merge(user_id: current_user.id)
  end

end
