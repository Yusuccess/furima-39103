require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do


  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    end
    context '商品が購入ができる時' do
      it 'User_id, Item_idが紐づいていて、カード情報、郵便番号、都道府県、市区町村、番地、電話番号が正しく入力されている時 ' do
        expect(@purchase_address).to be_valid
      end
      it '建物名が空でも登録できる' do
        @purchase_address.building_name = ""
        expect(@purchase_address).to be_valid
      end
    end

    context '商品が購入できない時' do
      it 'Userが紐付いていない場合は登録できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("User can't be blank")
      end
      it 'Itemが紐付いていない場合は登録できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("Item can't be blank")
      end
      it '郵便番号が空の時' do
        @purchase_address.postal_code = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("Postal code can't be blank")
      end
      it '郵便番号にハイフンがない時' do
        @purchase_address.postal_code = "1234567"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("Postal code input correctly")
      end
      it '郵便番号に必要な数の数字が記入されていない時' do
        @purchase_address.postal_code = "123-456"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("Postal code input correctly")
      end
      it '都道府県が選択されてない時' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("Prefecture select")
      end
      it '市区町村が空の時' do
        @purchase_address.city = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("City can't be blank")
      end
      it '市区町村に入力されて文字が、1字以上の全角ひらがな、全角カタカナ、漢字にマッチしない時' do
        @purchase_address.city = "abc"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("City is invalid. Input full-width characters.")
      end
      it '番地が空の時' do
        @purchase_address.house_number = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("House number can't be blank")
      end
      it '電話番号が空の時' do
        @purchase_address.phone_number = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("Phone number can't be blank")
      end
      it '電話番号が12桁以上の時' do
        @purchase_address.phone_number = "123456789012"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("Phone number is invalid")
      end
      it '電話番号に数字以外が入力された時' do
        @purchase_address.phone_number = "あいうえおkaskl"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("Phone number is invalid")
      end
      it 'カード情報が正しく入力されていない時' do
        @purchase_address.token = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("Token can't be blank")
      end
    end
  end
end
