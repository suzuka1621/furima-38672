class OrdersController < ApplicationController

  def index
    #unless current_user.id != item.user.id || user_signed_in?
      #redirect_to root_path
    #end
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
       @order_delivery.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_delivery).permit(:post_code, :prefecture_id, :municipality, :address_number, :building, :phone_number)
    .merge(user_id: current_user.id, item_id: @item.id)
  end

end
