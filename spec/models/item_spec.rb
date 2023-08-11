require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー新規登録' do
    context '商品を出品できる時' do
      it 'image,name,details,priceが存在し、category_idが1以外,condition_idが1以外,shipping_fee_idが1以外,shipping_day_idが1以外,prefecture_idが1以外であれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品を出品できない時' do
      it 'Userが紐付いていない場合は登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("User must exist")
      end
      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Image can't be blank")
      end
      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Name can't be blank")
      end
      it '商品説明が空では登録できない' do
        @item.details = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Details can't be blank")
      end
      it 'カテゴリーが選択されてないと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category can't be blank")
      end
      it '商品の状態が選択されてないと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Condition can't be blank")
      end
      it '配送料が選択されてないと登録できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Shipping fee can't be blank")
      end
      it '発送元の地域が選択されてないと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Prefecture can't be blank")
      end
      it '発送までの日数が選択されてないと登録できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Shipping day can't be blank")
      end
      it '価格が空だと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price can't be blank")
      end
      it '価格が数字でないと登録できない' do
        @item.price = 'nil'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price is not a number")
      end
      it '価格が300円より小さいと登録できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price must be greater than or equal to 300")
      end
      it '価格が10000000以上の値では登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price must be less than or equal to 9999999")
      end
    end

  end
end


  