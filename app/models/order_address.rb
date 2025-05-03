require 'payjp'

class OrderAddress
  include ActiveModel::Model

  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number,
                :user_id, :item_id, :token

                validates :post_code,
                presence: { message: "can't be blank" },
                format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
              
                 

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: { message: "can't be blank" }
  validates :address, presence: { message: "can't be blank" }

  validates :phone_number, presence: { message: "can't be blank" },
                           length: { minimum: 10, too_short: "is too short" },
                           format: {
                             with: /\A\d{10,11}\z/,
                             message: "is invalid. Input only number"
                           }

  validates :user_id, presence: { message: "can't be blank" }
  validates :item_id, presence: { message: "can't be blank" }

  def save
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(item_id).price,
      card: token,
      currency: 'jpy'
    )

    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(
      post_code: post_code,
      prefecture_id: prefecture_id,
      city: city,
      address: address,
      building_name: building_name,
      phone_number: phone_number,
      order_id: order.id
    )
  end
end
