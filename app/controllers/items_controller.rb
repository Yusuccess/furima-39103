class ItemsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, except: [:index, :new, :create]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @items = Item.order("created_at DESC")
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
  end
  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
    
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :details, :price, :category_id, :condition_id, :prefecture_id, :shipping_fee_id, :shipping_day_id).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    if current_user == @item.user
      if @item.purchase.present?
        return redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end


end
