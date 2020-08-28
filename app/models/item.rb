class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :buyer
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :pay_postage
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :prefecture

  validates :image, :category, :name, :explanation, :price, :condition, :pay_postage, :prefecture, :shipping_date, presence: true

  validates :category_id, :condition_id, :pay_postage_id, :shipping_date_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 }
end
