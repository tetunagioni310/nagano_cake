class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
    @total_price =  0
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      if cart_item.amount > 10
        cart_item.amount = 10
        cart_item.save
        redirect_to public_cart_items_path
      else
        cart_item.save
        redirect_to public_cart_items_path
      end
    else
      @cart_item.save
      redirect_to public_cart_items_path
    end
  end

  def update
    @cart_item = CartItem.find_by(id: params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    @cart_items = CartItem.all
    redirect_to public_cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to public_cart_items_path
  end

  private

  def cart_item_params
     params.require(:cart_item).permit(:item_id,:customer_id,:amount)
  end
end
