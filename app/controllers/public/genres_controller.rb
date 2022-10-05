class Public::GenresController < ApplicationController
  before_action :authenticate_customer!

  def show
    @items = Item.where(genre_id: params[:id]).page(params[:page]).per(8)
    @full_items = Item.where(genre_id: params[:id])
    @genre = Genre.find(params[:id])
    @genres = Genre.all
  end
end
