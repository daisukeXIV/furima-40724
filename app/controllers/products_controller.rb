class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to root_path
    else
      render template: 'items/new', status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    if @product.save
      redirect_to root_path
    else
      render 'items/edit', status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :condition_id, :postage_id, :prefecture_id,
                                    :delivery_time_id, :price, :image).merge(user_id: current_user.id)
  end
end
