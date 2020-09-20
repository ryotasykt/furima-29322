class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :redirect_root, only: [:index]

  def index
    @order = OrderAddress.new  #「OrderAddress」に編集
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_params)  #「OrderAddress」に編集
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
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

  def pay_item
    Payjp.api_key = "sk_test_56e59faec727342a2b15064a"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,           # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end