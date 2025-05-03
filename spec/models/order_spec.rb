require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, item_id: @item.id, user_id: @user.id)
    sleep 0.1
  end

  context '内容に問題がない場合' do
    it 'すべて正しく入力されていれば保存できる' do
      expect(@order_address).to be_valid
    end

    it '建物名が空でも保存できる' do
      @order_address.building_name = ''
      expect(@order_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'tokenが空では保存できない' do
      @order_address.token = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が空では保存できない' do
      @order_address.post_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code can't be blank")
    end

    it '郵便番号が「3桁ハイフン4桁」の形式でないと保存できない' do
      @order_address.post_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
    end

    it '都道府県が1だと保存できない' do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '市区町村が空では保存できない' do
      @order_address.city = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空では保存できない' do
      @order_address.address = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が空では保存できない' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号が9桁以下だと保存できない' do
      @order_address.phone_number = '123456789'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is too short")
    end

    it '電話番号が12桁以上だと保存できない' do
      @order_address.phone_number = '123456789012'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input only number")
    end

    it '電話番号にハイフンが含まれていると保存できない' do
      @order_address.phone_number = '090-1234-5678'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input only number")
    end

    it 'user_idが空だと保存できない' do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空だと保存できない' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end
