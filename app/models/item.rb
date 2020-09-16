class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee_burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_until_shipping

  PRICE_REGEX = /\A[0-9]+\z/.freeze

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_id, :condition_id, :shipping_fee_burden_id, :prefecture_id, :days_until_shipping_id, numericality: { other_than: 1, message: 'Select' }
    validates :price, format: { with: PRICE_REGEX, message: 'Half-width number' }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  end
end
