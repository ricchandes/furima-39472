class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to "/"
    else
      render :new, status: :unprocessable_entity   
    end

  end

  private #ここからプライベートだよー
  def item_params
    params.require(:item).permit(:name, :explanation, :image, :category_id, :status_id, :delivery_price_id, :delivery_price_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end


  
end
