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
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

  # def item_params
  #   params.require(:item).permit(:profile_image, :name, :introduction, :genre_id, :price, :is_active)
  # end

end

