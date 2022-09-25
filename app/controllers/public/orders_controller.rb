class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @address = Address.new
  end

  def thanks
  end

  def index
    @orders = Order.all
  end

  def show
  end

  def create
    @order = Order.new(order_params)
    @order.save
    @order_detail = OrderDetail.new
    current_customer.cart_items.each do |cart_item|
      @order_detail.item_id = cart_item.item_id
      @order_detail.order_id = @order.id
      @order_detail.purchase_price = cart_item.item.with_tax_price
      @order_detail.amount = cart_item.amount
      @order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to thanks_public_orders_path
  end

  def log
    @order = Order.new
    @cart_items = current_customer.cart_items
    @order.payment_method = params[:order][:payment_method]
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
      @order.bill = @order.shipping_cost
      @total_price = 0
      @bill = 0
      
    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
      @total_price = 0
      @bil = 0
      
    elsif params[:order][:address_option] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      @total_price = 0
      @bill = 0
      
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_id,:postal_code,:address,:name,:shipping_cost,:bill,:payment_method)
  end
  
  def order_detail_params
    params.require(:order).permit(:item_id,:order_id,:purchase_price,:amount)
  end
end
