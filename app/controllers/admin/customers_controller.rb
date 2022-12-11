class Admin::CustomersController < ApplicationController
 # def new
 #   @customer = Customer.new
 # end

 # def create
 #   @customer = Customer.find(params[:id])
 # end

 def index
   @items = Item.all
   @customers = Customer.all
   @customers = Customer.page(params[:page]).per(10)
 end

 def show
   @customer = Customer.find(params[:id])
 end

 def edit
   @customer = Customer.find(params[:id])
  unless @customer == current_customer
    redirect_to customer_path(current_customer)
  end
  end

end
