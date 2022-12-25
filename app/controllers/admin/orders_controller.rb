class Admin::OrdersController < ApplicationController

 def show
  @order = Order.find(params[:id])
  @orders = @order.order_details
  @items = Item.find(params[:id])
  @total = 0
  @shopping_cost = 800
 end

end
