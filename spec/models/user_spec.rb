require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context 'ユーザー登録ができる時' do
      it 'nickname,email,password,password_confirmation,last_name,first_name,last_name_reading,first_name_reading,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    
    context 'ユーザー登録ができない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = 'ttyl4'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = 'ttylekku990'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'パスワードは半角英字のみでは保存できない' do
        @user.password = 'kureyonnnttt'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end
      it 'パスワードは半角数字のみでは保存できない' do
        @user.password = '12347890123'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end
      it 'パスワードは全角英数混合では保存できない' do
       @user.password = 'ＦＫ１２３３５２３４'
       @user.valid?
       expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it 'last_nameが漢字・ひらがな・カタカナ以外を含むと登録できない' do
        @user.last_name = 'tanaka9'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid. Input full-width characters."
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it 'first_nameが漢字・ひらがな・カタカナ以外を含むと登録できない' do
        @user.first_name = 'yusuke4'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid. Input full-width characters."
      end

      it 'last_name_readingが空では登録できない' do
        @user.last_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name reading can't be blank"
      end

      it 'last_name_readingがカタカナ以外を含むと登録できない' do
        @user.last_name_reading = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name reading is invalid. Input full-width katakana characters."
      end

      it 'first_name_readingが空では登録できない' do
        @user.first_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name reading can't be blank"
      end

      it 'first_name_readingがカタカナ以外を含むと登録できない' do
        @user.first_name_reading = 'yusuke'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name reading is invalid. Input full-width katakana characters."
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
