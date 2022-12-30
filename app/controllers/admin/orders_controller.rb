class Admin::OrdersController < ApplicationController

 def show
  @order = Order.find(params[:id])
  @customer = @order.customer
  @order_details = @order.order_details
  @total = 0
  @shopping_cost = 800
 end

  # def show
  #   @order = Order.find(params[:id])
  #   @order_details = @order.order_details
  # end

 def update
   @order = Order.find(params[:id])
   @order.update(order_params)
   redirect_to order_path
 end

 private
 def order_params
  params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_price, :is_active)
 end

end
