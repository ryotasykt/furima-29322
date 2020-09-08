class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :explanation
  belongs_to_active_hash :shipping_fee_burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_until_shipping
end
