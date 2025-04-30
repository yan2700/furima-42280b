FactoryBot.define do
  factory :item do
    name                  { "商品名" }
    description           { "商品説明" }
    price                 { 1000 }
    category_id           { 2 }
    status_id             { 2 }
    shipping_fee_status_id { 2 }
    prefecture_id         { 2 }
    scheduled_delivery_id { 2 }
    association :user     
    after(:build) do |item|
      item.image.attach(
        io: File.open(Rails.root.join('spec/fixtures/files/test_image.jpg')),
        filename: 'test_image.jpg',
        content_type: 'image/jpg'
      )
    end
  end
end
