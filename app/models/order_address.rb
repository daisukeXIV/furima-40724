class OrderAddress
  include ActiveModel::Model
  attr_accessor(:post_code, :prefecture_id, :municipality, :street_address, :building, :tell, :user_id, :product_id, :token, :price)

  VALIDATE_POSTCODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/
  VALIDATE_TELL_REGEX = /\A[0-9]{10,11}\z/
  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :post_code, format: { with: VALIDATE_POSTCODE_REGEX, message: "is invalid. Include hyphen(-)", allow_blank: true }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :street_address
    validates :tell, format: { with: VALIDATE_TELL_REGEX, message: "は10桁以上11桁以内の半角数値で入力してください", allow_blank: true }
    validates :token
    validates :price
  end

  def save
    pay_item
    order = Order.create(user_id: user_id, product_id: product_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, street_address: street_address, building: building, tell: tell, order_id: order.id)
  end

  private

  def pay_item
    Payjp.api_key = 'ENV["PAYJP_SECRET_KEY"]'
    Payjp::Charge.create(
      amount: price,  # 商品の値段
      card: token,    # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end
end