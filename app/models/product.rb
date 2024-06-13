class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :postage
  has_one_attached :image
  # 空の項目を除外する記述
  with_options presence: true do
    validates :name
    validates :description
    validates :price, numericality: { only_integer: ture, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :user
    # '---'が格納されているid1を除外する記述
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :condition_id
      validates :poostage_id
      validates :prefecture_id
      validates :delivery_time_id
    end
  end
end
