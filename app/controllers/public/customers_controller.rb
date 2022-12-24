class Public::CustomersController < ApplicationController

 def new
  @customer = Customer.new
 end

 def show
   @customer = Customer.find(current_customer.id)
 end

 def withdrawal
   @customer = Customer.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
   @customer.update(is_deleted: true)
   reset_session
   flash[:notice] = "退会処理を実行いたしました"
   redirect_to root_path
 end

 def edit
  @customer = Customer.find(current_customer.id)
  unless @customer == current_customer
  end end

  def update
   current_customer.update(customer_params)
   redirect_to customers_path
  end

 private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end

 end

