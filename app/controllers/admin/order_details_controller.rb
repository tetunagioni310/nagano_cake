class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!


  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = Order.find_by(id: @order_detail.order.id)
    @order_detail.update(order_detail_params)
      
    if @order_detail.make_status == "in_production"
      @order.status = 2
      @order.save
      
    elsif @order_detail.make_status == "production_completed"
      #カウント用の変数定義
      @status_count = 0
      @order_detail_count = 0
      #注文品目数と制作完了状態をカウント
      @order_details = OrderDetail.where(order_id: @order.id)
      @order_details.each do |order_detail|
        @order_detail_count += 1
        if order_detail.make_status == "production_completed"
          @status_count += 1
        end
      end
      #注文品目が全て制作完了なら注文ステータスを発送準備中にする
      if @order_detail_count == @status_count
        @order.status = 3
        @order.save
      end
    end
    redirect_to admin_order_path(@order.id)
  end

  private
    def order_detail_params
      params.require(:order_detail).permit(:make_status)
    end
end
