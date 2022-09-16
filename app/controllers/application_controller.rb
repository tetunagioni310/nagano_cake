class ApplicationController < ActionController::Base
  
  def add_tax_price
    (self.price * 1.10).round
  end
end
