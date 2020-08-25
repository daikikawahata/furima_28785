class Item < ApplicationRecord
  belongs_to :user
  has_one :buyer
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :pay_postage
  belongs_to_active_hash :shipping_data
  belongs_to_active_hash :prefecture
end
