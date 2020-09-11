class ItemsController < ApplicationController
  before_action :move_to_sign_in, except: [:index]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :condition_id, :shipping_fee_burden_id, :prefecture_id, :days_until_shipping_id, :price).merge(user_id: current_user.id)
  end

  def move_to_sign_in
    redirect_to('/users/sign_in') unless user_signed_in?
  end
end
