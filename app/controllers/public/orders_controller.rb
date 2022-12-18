class Public::OrdersController < ApplicationController
 def new
  @order = Order.new
  @order= current_customer.cart_items
 end

 def show
  @cart_item = CartItem.find(params[:cart_item])
 end

 def complete
 end

 def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
 end

 def create
 end

 def order_params
  params.require(:order)
  .permit(:payment_method, :postal_code, :address, :name)
 end
end