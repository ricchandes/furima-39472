class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def create
    like = current_user.likes.build(item_id: params[:item_id])
    like.save

    respond_to do |format|
      format.js
    end
  end

  def destroy
    like = Like.find_by(params[:item_id])
    like.destroy
    respond_to do |format|
      format.js
    end

  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
