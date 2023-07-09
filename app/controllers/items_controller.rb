class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Items.new
  end

  def create
    Item.create(item_params)
    redirect_to '/'
  end

  private #ここからプライベートだよー
  def item_params
    params.require(:item).permit(:name, :explanation, :image, :category_id, :status_id, :delivery_price_id, :delivery_price_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end


  
end
