class OrderAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number
  
  POSTEL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  PHONE_NUMBER_REGEX = /\A\d{10,11}\z/.freeze

  with_options presence: true do
    # 「クレジットカード情報」に関するバリデーション
    validates :token
    # 「配送先住所」に関するバリデーション
    validates :postal_code, format: { with: POSTEL_CODE_REGEX }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :address
    validates :phone_number, format: { with: PHONE_NUMBER_REGEX }
  end

  def save
    # 「購入」の情報を保存し、「order」という変数に入れている
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end