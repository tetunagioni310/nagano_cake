class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :email, presence: true, format: { with: /\A\S+@\S+\.\S+\z/ }
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :address, presence: true
  validates :telephone_number, presence: true, format: { with: /\A\d{10}\z|\A\d{11}\z/ }

  def full_name
    self.last_name + "" + self.first_name
  end
  
  def full_name_kana
    self.last_name_kana + "" + self.first_name_kana
  end
  
  def is_deleted?
    if self.is_deleted == false 
      "有効"
    else 
      "退会"
    end
  end
end
