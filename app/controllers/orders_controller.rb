class OrdersController < ApplicationController
  def index
    @product = Product.find(params[:format])
    @address = Address.new
  end
end
