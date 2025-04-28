require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = User.create!(
      nickname: 'テスト太郎',
      email: 'test@example.com',
      password: 'password123',
      password_confirmation: 'password123',
      last_name: '山田',
      first_name: '太郎',
      last_name_kana: 'ヤマダ',
      first_name_kana: 'タロウ',
      birthday: '1990-01-01'
    )
  end

  it "is valid with valid attributes" do
    item = Item.new(
      name: "商品名",
      description: "商品説明",
      price: 1000,
      category_id: 2,
      status_id: 2,
      shipping_fee_status_id: 2,
      prefecture_id: 2,
      scheduled_delivery_id: 2,
      user: @user,
      image: Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/test_image.jpg'), 'image/jpg')
    )
    expect(item).to be_valid
  end

  # ----------------------
  # presence:true をテスト（nilなら "can't be blank" を期待）
  it "is invalid without a category" do
    item = Item.new(category_id: nil)
    item.valid?
    expect(item.errors[:category_id]).to include("can't be blank")
  end

  it "is invalid without a status" do
    item = Item.new(status_id: nil)
    item.valid?
    expect(item.errors[:status_id]).to include("can't be blank")
  end

  it "is invalid without a shipping fee status" do
    item = Item.new(shipping_fee_status_id: nil)
    item.valid?
    expect(item.errors[:shipping_fee_status_id]).to include("can't be blank")
  end 

  it "is invalid without a prefecture" do
    item = Item.new(prefecture_id: nil)
    item.valid?
    expect(item.errors[:prefecture_id]).to include("can't be blank")
  end

  it "is invalid without a scheduled delivery" do
    item = Item.new(scheduled_delivery_id: nil)
    item.valid?
    expect(item.errors[:scheduled_delivery_id]).to include("can't be blank")
  end  
    

  
end
