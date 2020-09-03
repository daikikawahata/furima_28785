class ShippingAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :buyer
  belongs_to_active_hash :prefecture

  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/

  validates :postal_code, :prefecture_id, :city, :house_number, :phone_number, presence: true
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/	}
  validates :phone_number, format: { with: VALID_PHONE_REGEX }
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
end
