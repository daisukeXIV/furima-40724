class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :postage
  belongs_to :user
  has_one_attached :image
  # 空の項目を除外する記述
  with_options presence: true do
    validates :name
    validates :description
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, allow_blank: true }
    validates :image
    # '---'が格納されているid1を除外する記述
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :condition_id
      validates :postage_id
      validates :prefecture_id
      validates :delivery_time_id
    end
  end
end
