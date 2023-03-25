class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order('created_at DESC')
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
    @items = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:item, :introduction, :price, :category_id, :item_state_id, :delivery_cost_id, :prefecture_id, :delivery_day_id,
                                 :image).merge(user_id: current_user.id)
  end
end
