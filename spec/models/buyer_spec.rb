require 'rails_helper'

RSpec.describe Buyer, type: :model do
  before do
    @buyer = FactoryBot.build(:buyer)
  end
  describe '購入者登録' do
    it '全ての値が入力されていれば保存できる' do
      expect(@buyer).to be_valid
    end
  end
end
