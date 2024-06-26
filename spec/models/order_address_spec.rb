require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, product_id: @product.id, price: @product.price)
    sleep 0.1
  end
  describe '商品購入' do
    context '商品購入成功' do
      it '全て正常に入されると購入できる' do
        expect(@order_address).to be_valid
      end
      it '建物が空でも購入できる' do
        expect(@order_address).to be_valid
      end
    end
    context '商品購入失敗' do
      it '郵便番号が空だと購入できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンが含まれてないと購入できない' do
        @order_address.post_code = '0000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県が空だと購入できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank", "Prefecture can't be blank")
      end
      it '市区町村が空だと購入できない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空だと購入できない' do
        @order_address.street_address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street address can't be blank")
      end
      it '電話番号が空だと購入できない' do
        @order_address.tell = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tell can't be blank")
      end
      it '電話番号が10文字未満だと購入できない' do
        @order_address.tell = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tell は10桁以上11桁以内の半角数値で入力してください")
      end
      it '電話番号が11より大きいと購入できない' do
        @order_address.tell = '12345678912345'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tell は10桁以上11桁以内の半角数値で入力してください")
      end
      it '電話番号に半角数字以外が含まれると購入できない' do
        @order_address.tell = '123-4567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tell は10桁以上11桁以内の半角数値で入力してください")
      end
      it 'tokenが空だと購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
