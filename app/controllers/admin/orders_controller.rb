class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
    @amount = 0
  end

  def show
  end
end
