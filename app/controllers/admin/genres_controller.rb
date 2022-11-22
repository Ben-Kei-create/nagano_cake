class Admin::GenresController < ApplicationController

  def new
   @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
  end

  def index
  @genres = Genre.all
  end

  def show
  @post_image = PostImage.new
  @item = Item.find(params[:id])
  end

def edit
  @genre = Genre.find(genre_params)
end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
  end
