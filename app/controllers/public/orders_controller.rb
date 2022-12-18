class Public::OrdersController < ApplicationController
 def new
  @customer = current_customer
  @order = Order.new
 end

 def show
  # @order = Order.find(params[:id])
  end


 def complete
 end

 def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == 0
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.name
    elsif params[:order][:select_address] == 1
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
   end
 end

 def create
 end

 def order_params
  params.require(:order)
  .permit(:payment_method, :postal_code, :address, :name)
 end
end