class ItemsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, except: [:index, :new, :create]
  before_action :contributor_confirmation, only: [:edit, :update]

  def index
    @items = Item.order("created_at DESC")
    @purchase = Purchase.all
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
    @item = Item.find(params[:id])
  end
  def edit
    @item = Item.find(params[:id])
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :details, :price, :category_id, :condition_id, :prefecture_id, :shipping_fee_id, :shipping_day_id).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end


end
