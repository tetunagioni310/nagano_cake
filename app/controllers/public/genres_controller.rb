class Public::GenresController < ApplicationController
  before_action :authenticate_customer!

  def show
    @items = Item.where(genre_id: params[:id]).page(params[:page]).per(8)
    @genre = Genre.find(params[:id])
    @genres = Genre.all
  end
end
