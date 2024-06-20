class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update]
  before_action :set_product, only: [:update, :destroy]
  before_action :correct_user, only: [:update, :destroy]
  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to root_path
    else
      render template: 'items/new', status: :unprocessable_entity
    end
  end

  def update
    @product.update(product_params)
    if @product.save
      redirect_to item_path(@product)
    else
      render 'items/edit', status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :condition_id, :postage_id, :prefecture_id,
                                    :delivery_time_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def correct_user
    redirect_to root_path unless current_user.id == @product.user_id
  end
end
