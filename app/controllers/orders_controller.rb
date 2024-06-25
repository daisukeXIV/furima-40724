class OrdersController < ApplicationController
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @product = Product.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @product = Product.find(params[:item_id])
    @order_address = OrderAddress.new(order_param)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'orders/index', status: :unprocessable_entity
    end
  end

  private

  def order_param
    params.require(:order_address).permit(:post_code, :prefecture_id, :municipality, :street_address, :building, :tell).merge(user_id: current_user.id, product_id: params[:item_id],token: params[:token], price: @product.price)
  end
end
