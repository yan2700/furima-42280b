<<<<<<< HEAD
class Order < ApplicationRecord

=======
class Order < ApplicationRecord

  belongs_to :user
  belongs_to :item

  belongs_to :item
  belongs_to :user

end
>>>>>>> e9ec3ff4cedb8e1a6c7f2f35330569d4fc8b8072
