class Public::CustomersController < ApplicationController
 def new
  @customer = Customer.new
 end

 def unsubscribe
 end

 def information
 end

 def show
  @customer = Customer.find(params[:id])
 end

 end

