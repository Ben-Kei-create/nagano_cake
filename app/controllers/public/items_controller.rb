class Public::ItemsController < ApplicationController
 def index
  # @items = Item.profile_image.page(params[:page])
  @items = Item.all
  @items = Item.page(params[:page]).per(10)
 end

 def show
   @post_image = PostImage.new
   @item = Item.find(params[:id])
   @items = Item.all
   @cart_item = CartItem.new
 end

end
