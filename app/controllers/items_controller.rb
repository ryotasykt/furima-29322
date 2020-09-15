class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :

  def index
    @item = Item.all.order('id DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
      if @item.update(item_params)
        redirect_to item_path(@item.id)
      else
        redirect_to action: :edit
      end
    else
      redirect_to action: :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :condition_id, :shipping_fee_burden_id, :prefecture_id, :days_until_shipping_id, :price).merge(user_id: current_user.id)
  end
end
