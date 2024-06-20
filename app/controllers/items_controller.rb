class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_product, only: [:show, :edit]
  def index
    @products = Product.all.order('id DESC')
  end

  def new
    @product = Product.new
  end

  def show
  end

  def edit
    return if current_user.id == @product.user_id

    redirect_to root_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
