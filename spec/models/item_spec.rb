
require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品が出品できる場合' do
      it 'すべての入力項目が正しく存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it 'カテゴリーが未選択だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors[:category_id]).to include("can't be blank")
      end

      it 'ステータスが未選択だと登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors[:status_id]).to include("can't be blank")
      end

      it '配送料負担が未選択だと登録できない' do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors[:shipping_fee_status_id]).to include("can't be blank")
      end

      it '発送元の地域が未選択だと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors[:prefecture_id]).to include("can't be blank")
      end

      it '発送までの日数が未選択だと登録できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors[:scheduled_delivery_id]).to include("can't be blank")
      end

      it '商品名が空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors[:name]).to include("can't be blank")
      end

      it '商品説明が空だと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors[:description]).to include("can't be blank")
      end

      it '価格が空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors[:price]).to include("can't be blank")
      end

      it '画像が空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include("can't be blank")
      end

      it '価格が299円以下だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors[:price]).to include("must be greater than or equal to 300")
      end

      it '価格が10,000,000円以上だと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors[:price]).to include("must be less than or equal to 9999999")
      end

      it '価格が半角数値以外では登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors[:price]).to include('is not a number')
      end

      it 'userが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors[:user]).to include("must exist")
      end
    end
  end
end
