FactoryBot.define do
  factory :order_address do
    post_code      { '123-4567' }
    prefecture_id  { 2 }
    city           { '日向市' }
    address        { '青山1-1-1' }
    building_name  { '柳ビル101' }
    phone_number   { '09012345678' }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
