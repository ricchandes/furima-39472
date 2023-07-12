class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update]


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
  end

  def edit
    if current_user.id == @item.user_id
    else
      redirect_to user_session_path
    end
  end


  def update
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

  def set_item
    @item = Item.find(params[:id])
  end

end
