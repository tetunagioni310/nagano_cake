class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  validates :item_id, uniqueness: true
  
  def total_price
    self.item.price*self.amount
  end
end
