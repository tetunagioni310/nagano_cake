class Admin::ItemsController < ApplicationController
  def new
    @genres = Genre.all
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end
  
  def destroy
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name,:introduction,:price,:is_active,:genre_id,:image)
  end
end
