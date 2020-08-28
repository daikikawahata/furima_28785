require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it "全ての値が存在すれば保存できる" do
      expect(@item).to be_valid
    end
    it "画像が空では保存できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "商品名が空では保存できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "商品の説明が空では保存できないこと" do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
      
    end
    it "カテゴリーが空では保存できないこと" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "商品の状態が空だと保存できないこと" do
      @item.condition_id = nil
      @item.valid?

      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it "発送元の地域が空だと保存できないこと" do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "発送までの日時が空だと保存できないこと" do
      @item.shipping_date_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date can't be blank")
    end
    it "ユーザーが紐付いていないと保存できない" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
    it "価格が空では保存できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "価格の範囲が¥300~¥9999999の間であること" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 9999999")
    end
    it "価格の範囲が¥300~¥9999999の間であること" do
      @item.price = 10
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 300")
    end
    it "販売価格は半角数字以外だと保存できないこと" do
      @item.price = "５０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
