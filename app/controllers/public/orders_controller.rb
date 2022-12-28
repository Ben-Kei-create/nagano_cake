class Public::OrdersController < ApplicationController

 def new
  @customer = current_customer
  @order = Order.new
 end

 def show
  @order = Order.find(params[:id])
  @orders = @order.order_details
  @shopping_cost = 800
  @total = 0
 end

 def create
   @order = Order.new(order_params)
   @order.customer_id = current_customer.id
   @order.shopping_cost = 800
  if @order.save
   @cart_items = current_customer.cart_items
   @cart_items.each do |cart_item|
   @order_detail = OrderDetail.new
   @order_detail.order_id = @order.id
   @order_detail.item_id = cart_item.item_id
   @order_detail.price = cart_item.item.price
   @order_detail.amount = cart_item.amount
   @order_detail.save
  end
   @cart_items.destroy_all
   flash[:notice] = "Your purchase was successful."
   redirect_to orders_complete_path
  else
   flash.now[:danger] = "Your purchase wasn't successful."
   redirect_to customers_path(current_customer)
  end
 end

 def complete
 end

 def index
  @orders = Order.all
  @shopping_cost = 800
  @total = 0
 end

 def confirm
   @total = 0
   @shopping_cost = 800
   @orders = current_customer.orders
   @order = Order.new(order_params)
  if params[:order][:select_address] == "0"
   @order.payment_method = params[:order][:select_address].to_i
   @order.postal_code = current_customer.postal_code
   @order.address = current_customer.address
   @order.name = current_customer.last_name + '  ' + current_customer.first_name
  elsif params[:order][:select_address] == "1"
   @address = Address.find(params[:order][:address_id])
   @order.postal_code = @address.postal_code
   @order.address = @address.address
   @order.name = @address.name
  else params[:order][:select_address] == "2"
   @order.save
  end
 end

 private
 def order_params
  params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_price, :is_active)
 end
end