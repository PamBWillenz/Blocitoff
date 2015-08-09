class ItemsController < ApplicationController
  # unused action
  def new
    @user = User.find(params[:user_id])
    @item = Item.new
  end

  def create
    @user = User.find(params[:user_id])
    @items = @user.items
    @item = current_user.items.build(item_params)
    # @item = Item.new(item_params)
    # @item == <#Item name: params[:name], body: params[:body] >
    @item.user = @user
    @new_item = Item.new

    if @item.save
      flash[:notice] = "Your item was saved."
    else
      flash[:error] = "There was an error saving your item."
    end

    respond_to do |format|
      format.html 
      format.js
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @item = @user.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item was completed."
    else
      flash[:error] = "Item couldn't be removed. Try again."
    end

    respond_to do |format|
      format.html 
      format.js
    end
  end


  
  private

  def item_params
    params.require(:item).permit(:name, :body)
  end
end
