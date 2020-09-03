class ShippingAddressBuyer
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :buyer_id, :token

  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/.freeze

  validates :postal_code, :prefecture_id, :city, :house_number, :phone_number, :token, presence: true
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/	}
  validates :phone_number, format: { with: VALID_PHONE_REGEX }
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, buyer_id: user_id)

    Buyer.create(user_id: user_id, item_id: item_id)
  end
end
