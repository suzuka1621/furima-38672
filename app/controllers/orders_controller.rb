class OrdersController < ApplicationController

  def index
    #unless current_user.id != item.user.id || user_signed_in?
      #redirect_to root_path
    #end
    @order_delivery = OrderDelivery.new
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
       @order_delivery.save
       redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order_delivery).permit(:post_code, :prefecture_id, :municipality, :address_number, :building, :phone_number, :item_id)
    .merge(user_id: current_user.id)
  end

end
