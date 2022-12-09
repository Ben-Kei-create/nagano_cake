class Public::ItemsController < ApplicationController
 def index
  # @items = Item.profile_image.page(params[:page])
  @items = Item.all
 end

  def show
   @post_image = PostImage.new
   @item = Item.find(params[:id])
   @items = Item.all
   redirect_to cart_items_path
  end

end
