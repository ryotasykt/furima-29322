class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :redirect_root, only: [:index]

  def index
    @order = OrderAddress.new  #「OrderAddress」に編集
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_params)  #「OrderAddress」に編集
  end  

  private

  def redirect_root
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def order_params
    #「配送先住所」のキーも追加
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

end