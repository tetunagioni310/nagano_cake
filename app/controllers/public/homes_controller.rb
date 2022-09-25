class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.all.page(params[:page]).per(5)
  end
  
  def about
  end
end
