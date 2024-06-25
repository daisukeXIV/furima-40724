class OrdersController < ApplicationController
  before_action :set_product, only: [:index, :create]
  before_action :soldout_judge, only: [:index, :create]
  def index
    set_gon_publickey
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_param)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      set_gon_publickey
      render 'orders/index', status: :unprocessable_entity
    end
  end

  private

  def order_param
    params.require(:order_address).permit(:post_code, :prefecture_id, :municipality, :street_address, :building, :tell).merge(user_id: current_user.id, product_id: params[:item_id],token: params[:token], price: @product.price)
  end

  def set_product
    @product = Product.find(params[:item_id])
  end

  def soldout_judge
    set_product
    redirect_to root_path unless @product.order.nil?
  end

  def set_gon_publickey
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  end
end
