class Admin::OrderDetailsController < ApplicationController
  
  def show
    @order_details = OrderDetail.where(order_id: params[:id])
    @order = Order.find(params[:id])
    @customer = Customer.find_by(id: @order.customer_id)
    @order_detail = OrderDetail.new
    @item_total = 0
    @total_price = 0
  end
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to admin_orders_path
  end
  
  private
  
  def order_detail_params
    params.require(:order_detail).permit(:make_status)
  end
end
