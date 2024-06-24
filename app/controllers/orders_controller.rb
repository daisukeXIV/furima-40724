class OrdersController < ApplicationController
  def index
    @product = Product.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_param)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      @product = Product.find(params[:item_id])
      render 'orders/index', status: :unprocessable_entity
    end
  end

  private

  def order_param
    params.require(:order_address).permit(:post_code, :prefecture_id, :municipality, :street_address, :building, :tell).merge(user_id: current_user.id, product_id: params[:item_id])
  end
end
