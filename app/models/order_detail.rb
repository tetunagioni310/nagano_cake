class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
  
  validates :item_id, presence: true
  validates :amount, presence:true
  
  enum make_status: {
    cannot_start:             0, #着手不可
    waiting_for_production:   1, #制作待ち
    in_production:            2, #製作中
    production_completed:     3  #制作完了
  }
end
