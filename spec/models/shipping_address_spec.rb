require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  describe '商品購入機能' do
    before do
      @address = FactoryBot.build(:shipping_address)
    end
    it "全ての値が正しく入力されていれば保存できる" do
      expect(@address).to be_valid
    end
    it "郵便番号が空では保存ができない" do
      @address.postal_code = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Postal code can't be blank")
    end
    it "郵便番号にハイフンがある正しい記述でないと保存できない" do
      @address.postal_code = 1234567
      @address.valid?
      expect(@address.errors.full_messages).to include("Postal code is invalid")
    end
    it "都道府県が空では保存ができない" do
      @address.prefecture_id = 0
      @address.valid?
      expect(@address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "市区町村が空では保存できない" do
      @address.city = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("City can't be blank")
    end
    it "番地が空では保存できない" do
      @address.house_number = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("House number can't be blank")
    end
    it "建物名はからでも保存できる" do
      @address.building_name = nil
      expect(@address).to be_valid
    end
    it "電話番号が空では保存できない" do
      @address.phone_number = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone number can't be blank")
    end
  end
end
