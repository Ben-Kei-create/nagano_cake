class Public::CartItemsController < ApplicationController
 def index
  @cart_items = CartItem.all
 end

 def destroy_all
  current_customer.cart_items.destroy_all
  redirect_to cart_items_path
 end

 def destroy
 end

private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end


end
