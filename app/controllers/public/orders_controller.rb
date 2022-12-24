class Public::OrdersController < ApplicationController
 def new
  @customer = current_customer
  @order = Order.new
 end

 def show
 end

 def create
  @order = Order.new(order_params)
  @order.id = current_customer.id
  if @order.save
   flash[:notice] = "Your purchase was successful."
   redirect_to orders_complete_path(current_customer)
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
    if params[:order][:select_address] == 0
    @order.payment_method = params[:order][:select_address].to_i
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.last_name + '  ' + current_customer.first_name
    elsif params[:order][:select_address] == 1
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    else params[:order][:select_address] == 2
    @order = Order.new(order_params)
    @order.address = Order.new
    @order.save
   end
 end

 def order_params
  params.require(:order).permit(:payment_method, :postal_code, :address, :name)
 end
end