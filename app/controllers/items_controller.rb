class ItemsController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end
  def new
    @item = Item.new
  end
  def create
    #binding.pry
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :details, :price, :category_id, :condition_id, :prefecture_id, :shipping_fee_id, :shipping_day_id).merge(user_id: current_user.id)
  end
end
