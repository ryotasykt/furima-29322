require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品の出品がうまくいくとき' do
      it 'image、name、explanation、category、condition、shipping_fee_burden、prefecture、days_until_shipping、priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品がうまくいかないとき' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationが空だと出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'categoryが選択されていないと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'conditionが選択されていないと出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition Select')
      end
      it 'shipping_fee_burdenが選択されていないと出品できない' do
        @item.shipping_fee_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee burden Select')
      end
      it 'prefectureが選択されていないと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end
      it 'days_until_shippingが選択されていないと出品できない' do
        @item.days_until_shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days until shipping Select')
      end
      it 'priceが空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300円未満だと出品できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが9,999,999円より高いと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'ユーザーが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
