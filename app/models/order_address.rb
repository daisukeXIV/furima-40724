class OrderAddress
  include ActiveModel::Model
  attr_accessor(:post_code, :prefecture_id, :municipality, :street_address, :building, :tell, :user_id, :product_id)

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, street_address: street_address, building: building, tell: tell, order_id: order.id)
  end
end