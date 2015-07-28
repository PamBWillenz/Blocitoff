class ItemsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @item = Item.new(item_params)
  end

  
  private

  def item_params
    params.require(:item).permit(:name, :body)
  end
end
