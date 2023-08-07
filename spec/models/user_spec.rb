require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    
    it 'nicknameが空では登録できない' do
      # nicknameが空では登録できないテストコードを記述します
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"

    end
    it 'emailが空では登録できない' do
      # emailが空では登録できないテストコードを記述します
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"

    end
    it 'passwordが空では登録できない' do
      # passwordが空では登録できないテストコードを記述します
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'last_nameが空では登録できない' do
      # last_nameが空では登録できないテストコードを記述します
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it 'first_nameが空では登録できない' do
      # first_nameが空では登録できないテストコードを記述します
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'last_name_readingが空では登録できない' do
      # last_name_readingが空では登録できないテストコードを記述します
      @user.last_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name reading can't be blank"
    end
    it 'first_name_readingが空では登録できない' do
      # first_name_readingが空では登録できないテストコードを記述します
      @user.first_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name reading can't be blank"
    end
    it 'birthdayが空では登録できない' do
      # birthdayが空では登録できないテストコードを記述します
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end
