class Public::AddressesController < ApplicationController

 # def new
 #  @address = Address.new
 # end

 # def create
 #  @address = Address.new(address_params)
 #  @address.save
 #  redirect_to addresses_path
 # end

 def index
  @address = Address.new(address_params)
  @address.save
  redirect_to addresses_path
  @addresses = Address.all
 end

 def show
 end

 def edit
   @address = Address.find(params[:id])
 end

 def update
  @address = Address.find(params[:id])
  @address.update(address_params)
  redirect_to admin_genres_path
 end

 def destroy
 end

 private
 def address_params
    params.require(:address).permit(:postal_code, :address, :name)
 end
end
