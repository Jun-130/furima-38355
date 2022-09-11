class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(
      :zip_code, :prefecture_id, :city, :street, :building, :phone_number
    ).merge(user_id: current_user.id, item_id: @item.id)
  end
end
