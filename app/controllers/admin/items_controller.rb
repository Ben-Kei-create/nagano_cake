class Admin::ItemsController < ApplicationController

  def new
   @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_item_path(item.id)
  end

  def index
  @items = Item.all
  @post_images = XXX
  end

  def show
  @post_image = PostImage.new
  @item = Item.find(params[:id])
  end

def edit
  @item = Item.find(params.id)
  @post_image = PostImage.find(params.id)
end

  private
  def item_params
    params.require(:item).permit(:profile_image, :name, :introduction, :genre_id, :price, :is_active)
  end
  end
