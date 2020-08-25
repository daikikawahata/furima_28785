require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録の保存' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@user).to be_valid
    end
    it 'nicknameが空だと保存できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空だと保存できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'emailに＠を含んだ正しい形式でないと保存できないこと' do
      @user.email = 'daikikawahataicliud.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空だと保存できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが6文字未満だと保存できないこと' do
      @user.password = 'abc12'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが半角英数字混合でないと保存できないこと' do
      @user.password = 'かわはただいき'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'family_nameが空だと保存できないこと' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'first_nameが空だと保存できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'family_nameが全角（漢字・ひらがな・カタカナ）でないと保存できないこと' do
      @user.family_name = 'kawahata'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name is invalid')
    end
    it 'first_nameが全角（漢字・ひらがな・カタカナ）でないと保存できないこと' do
      @user.first_name = 'daiki'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it 'family_name_furiganaが空だと保存できないこと' do
      @user.family_name_furigana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name furigana can't be blank")
    end
    it 'first_name_furiganaが空だと保存できないこと' do
      @user.first_name_furigana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name furigana can't be blank")
    end
    it 'family_name_furiganaが全角（カタカナ）でないと保存できないこと' do
      @user.family_name_furigana = 'kawahata'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name furigana is invalid')
    end
    it 'first_name_furiganaが全角（カタカナ）でないと保存できないこと' do
      @user.first_name_furigana = 'daiki'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name furigana is invalid')
    end
    it 'birth_dayが空だと保存できないこと' do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
