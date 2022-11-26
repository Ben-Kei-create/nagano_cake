class Public::CustomersController < ApplicationController
 def unsubscribe
 end

 def information
 end

 def show
  @customer = Customer.find(params[:id])
 end

 end

