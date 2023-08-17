class PurchaseAddress 
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    #Addressモデルのバリデーション
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'input correctly' }

    #validates :postal_code,       format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "input correctly"}
    validates :prefecture_id ,    numericality: {other_than: 1, message: "select"}
    validates :city,              format: {with: /\A[ぁ-んァ-ヶ一-龥々ー0-9０-９A-ZＡ-Ｚ\-]+\z/, message: "is invalid."}
    validates :house_number
    validates :phone_number,      format: {with: /\A\d{10,11}\z/, messages: "is invalid"} 
    #Purchaseモデルのバリデーション
    validates :item_id
    validates :user_id
    validates :token
  end

  def save
    #購入テーブルに商品idとユーザidを保存
    purchase = Purchase.create(item_id: item_id, user_id: user_id)

    #住所テーブルに保存(先に生成したpurchaseをid付けて保存)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end

end