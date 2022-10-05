class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  
  def new
    @genres = Genre.all
    @item = Item.new
  end

  def index
    @items = Item.all.page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      @genres = Genre.all
      render 'new'
    end
  end

  def destroy
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item.id)
    else
      @genres = Genre.all
      render 'edit'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:introduction,:price,:is_active,:genre_id,:image)
  end
end
