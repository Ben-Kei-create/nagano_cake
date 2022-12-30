class Admin::HomesController < ApplicationController

 def top
  @order = Order.all
  @order_details = OrderDetail.page(params[:page]).per(10)
  @total = 0
 end

end
