class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all.page(params[:page]).per(10)
    @amount = 0
  end

  def show
    order = Order.find(params[:id])
    @customer = Customer.find_by(id: order.customer_id)
    @orders = Order.where(customer_id: @customer.id).page(params[:page]).per(10)
    @amount = 0
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_orders_path
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
