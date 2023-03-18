class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
     Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:item, :introduction, :price, :category_id, :item_status_id, :delivery_cost_id, :prefecture_id, :delivery_day_id, :user_id)
  end
  
end
