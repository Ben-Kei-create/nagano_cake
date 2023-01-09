class Public::CartItemsController < ApplicationController

 def index
  @cart_items = current_customer.cart_items
  @total = 0
 end

 def new
  @cart_item = CartItem.new
 end

 def create
   @cart_item = CartItem.new(cart_item_params)
		 @cart_item.customer_id = current_customer.id
		if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
		 @already = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
	  @already.amount += params[:cart_item][:amount].to_i
			@already.save
			redirect_to cart_items_path
		elsif @cart_item.save
			redirect_to cart_items_path
		else
			render '/cart_items'
		end
		end

  def update
   @cart_item = CartItem.find(params[:id])
   @cart_item.update(cart_item_params)
   redirect_to cart_items_path
  end

 def destroy_all
  current_customer.cart_items.destroy_all
  redirect_to cart_items_path
 end

 def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path, notice: '商品をカートから削除しました。'
 end

private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end
