class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @products = Product.all.order('id DESC')
  end

  def new
    @product = Product.new
  end
end
