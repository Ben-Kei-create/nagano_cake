class Admin::ItemsController < ApplicationController

  def new
  @item = Item.new
  end

  def create
  @item = Item.new(item_params)
  @item.save
  redirect_to admin_item_path(@item.id)
  end

  def index
  @items = Item.all
  @items = Item.page(params[:page]).per(10)
  @genres = Genre.all
  end

  def show
  @post_image = PostImage.new
  @item = Item.find(params[:id])
  @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :profile_image, :genre_id)
  end

  def genre_params
    params.require(:genre).permit(:name)
  end

  end
