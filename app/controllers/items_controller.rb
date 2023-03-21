class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    authenticate_user!
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

  private

  def item_params
    params.require(:item).permit(:item, :introduction, :price, :category_id, :item_state_id, :delivery_cost_id, :prefecture_id, :delivery_day_id,
                                 :image).merge(user_id: current_user.id)
  end
end
