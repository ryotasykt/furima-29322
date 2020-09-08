class ItemsController < ApplicationController
  before_action :move_to_sign_in, except: [:index]
  def index 
  end

  def new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end

  def move_to_sign_in
    unless user_signed_in?
      redirect_to("/users/sign_in")
    end
  end

end
