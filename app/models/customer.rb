class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  
  def full_name
    self.last_name + "" + self.first_name
  end
  
  def is_deleted?
    if self.is_deleted == false 
      "有効"
    else 
      "退会"
    end
  end
end
