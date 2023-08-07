require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      # nicknameが空では登録できないテストコードを記述します
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: '西野', first_name: '佑介', last_name_reading: 'ニシノ', first_name_reading: 'ユウスケ', birthday: '1993-09-03',)
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      # emailが空では登録できないテストコードを記述します
      user = User.new(nickname: 'sakusesu', email: '', password: '000000', password_confirmation: '000000', last_name: '西野', first_name: '佑介', last_name_reading: 'ニシノ', first_name_reading: 'ユウスケ', birthday: '1993-09-03',)
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")

    end
    it 'passwordが空では登録できない' do
      # passwordが空では登録できないテストコードを記述します
      user = User.new(nickname: 'sakusesu', email: 'test@example', password: '', password_confirmation: '', last_name: '西野', first_name: '佑介', last_name_reading: 'ニシノ', first_name_reading: 'ユウスケ', birthday: '1993-09-03',)
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'last_nameが空では登録できない' do
      # last_nameが空では登録できないテストコードを記述します
      user = User.new(nickname: 'sakusesu', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: '', first_name: '佑介', last_name_reading: 'ニシノ', first_name_reading: 'ユウスケ', birthday: '1993-09-03',)
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      # first_nameが空では登録できないテストコードを記述します
      user = User.new(nickname: 'sakusesu', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: '西野', first_name: '', last_name_reading: 'ニシノ', first_name_reading: 'ユウスケ', birthday: '1993-09-03',)
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_name_readingが空では登録できない' do
      # last_name_readingが空では登録できないテストコードを記述します
      user = User.new(nickname: 'sakusesu', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: '西野', first_name: '佑介', last_name_reading: '', first_name_reading: 'ユウスケ', birthday: '1993-09-03',)
      user.valid?
      expect(user.errors.full_messages).to include("Last name reading can't be blank")
    end
  end
end
