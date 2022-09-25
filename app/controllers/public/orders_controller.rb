class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
    @address = Address.new
  end

  def thanks
  end

  def index
  end

  def show
  end
  
  def create
  end
  
  def log
    @order = Order.new
    @cart_items = current_customer.cart_items
    @order.payment_method = params[:order][:payment_method]
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
      @order.shipping_cost = 800
      @order.bill = 800
      @total_price = 0
      
      
    elsif params[:order][:address_option] == "1"
      @sta = params[:order][:address].to_i
      @address = Address.find(@sta)
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.full_name
      @order.shipping_cost = 800
      @total_price = 0
      
    elsif params[:order][:address_option] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      @order.shipping_cost = 800
      @total_price = 0
      
    end
  end
  
  private
  
  def order_params
    params.require(:order).permit(:name,:email,:postal_code,:address,:telephone_number,:shopping_cost)
  end
end
