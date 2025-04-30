
class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  belongs_to :user
  has_one_attached :image
  
#has_one :order


  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
    validates :category_id
    validates :status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :category_id, :status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id,
            numericality: { other_than: 1, message: "can't be blank" }  
  
end

class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  def sold_out?
    order.present?
  end
  
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  belongs_to :user
  has_one_attached :image

  
#has_one :order



  has_one :order

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
    validates :category_id
    validates :status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :category_id, :status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id,
            numericality: { other_than: 1, message: "can't be blank" }  
  
end
>>>>>>> e9ec3ff4cedb8e1a6c7f2f35330569d4fc8b8072
