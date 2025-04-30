class Order < ApplicationRecord

  belongs_to :user
  belongs_to :item

  belongs_to :item
  belongs_to :user

end
