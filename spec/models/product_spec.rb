require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end
  describe '商品登録' do
    context '商品登録できる場合' do
      it 'すべて正常に入力された場合' do
        expect(@product).to be_valid
      end
    end
    context '商品登録できない場合' do
      it 'imageが空の場合登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空の場合登録できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明が空の場合登録できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが空の場合登録できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が空の場合登録できない' do
        @product.condition_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担情報が空だと登録できない' do
        @product.postage_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Postage can't be blank")
      end
      it '発送元の地域が空だと登録できない' do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数が空だと登録できない' do
        @product.delivery_time_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery time can't be blank")
      end
      it 'priceが空だと登録できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300未満だと登録できない' do
        @product.price = '299'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが10000000以上だと登録できない' do
        @product.price = '10000000'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '半角数字以外が入力されると登録できない' do
        @product.price = '３００'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end
      it 'userが紐づいていないと登録できないい' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end
    end
  end
end
