class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @orders = Order.all.page(params[:page]).per(10)
    @amount = 0
  end

  def show
    @order_details = OrderDetail.where(order_id: params[:id])
    @order = Order.find(params[:id])
    @customer = Customer.find_by(id: @order.customer_id)
    @order_detail = OrderDetail.new
    @item_total = 0
    @total_price = 0
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status == "confirm"
      @order_details = OrderDetail.where(order_id: @order.id)
      @order_details.each do |order_detail|
        order_detail.make_status = 1
        order_detail.save
      end
      redirect_to admin_order_path(@order.id)
    else
      redirect_to admin_order_path(@order.id)
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
