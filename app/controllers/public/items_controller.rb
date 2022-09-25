class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @genres = Genre.all
    @items = Item.all.page(params[:page]).per(8)
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
