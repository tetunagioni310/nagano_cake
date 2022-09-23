class Public::GenresController < ApplicationController

  def show
    @items = Item.where(genre_id: params[:id]).page(params[:page]).per(8)
    @genre = Genre.find(params[:id])
    @genres = Genre.all
  end
end
