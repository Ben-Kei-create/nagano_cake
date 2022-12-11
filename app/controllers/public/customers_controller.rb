class Public::CustomersController < ApplicationController

 def new
  @customer = Customer.new
 end

 def show
  @customer = Customer.find(current_customer.id)
 end

 def edit
  @customer = current_customer
 end

  def update
   current_customer.update(customer_params)
   redirect_to customers_path
  end

 private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end

 end

