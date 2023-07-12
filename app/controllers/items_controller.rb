class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if user_signed_in? && current_user.id == @item.user_id
    else
      redirect_to user_session_path
    end

  end


  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end

  end
  private # ここからプライベートだよー

  def item_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :status_id, :prefecture_id, :delivery_price_id,
                                 :delivery_date_id, :price).merge(user_id: current_user.id)
  end
end
