class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :redirect_root, only: [:index]

  def index
  end

  def create
  end  

  private

  def redirect_root
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

end