class Admin::CustomersController < ApplicationController
 def index
   @items = Item.all
   @customers = Customer.all
   @customers = Customer.page(params[:page]).per(10)
 end

 def show
   @customer = Customer.find(params[:id])
 end

end
