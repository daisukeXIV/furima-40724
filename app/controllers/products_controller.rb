class ProductsController < ApplicationController
  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to root_path
    else
      render template: 'items/new', status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :condition_id, :postage_id, :prefecture_id, :delivery_time_id, :price, :image).merge(user_id: current_user.id)
  end
end
