class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :input_item, only: [:index, :create]
  before_action :contributor_confirmation, except: [:create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_32bbf384d4cdf182c7da605d"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def input_item
    @item = Item.find(params[:item_id])
  end

  def contributor_confirmation
    if @item.purchase.present?
      redirect_to root_path 
     else
      if current_user == @item.user
        redirect_to root_path 
      end
    end
  end

end
