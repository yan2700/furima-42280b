FactoryBot.define do
  factory :item do
    name { "MyString" }
    description { "MyText" }
    price { 1 }
    user { nil }
  end
end
