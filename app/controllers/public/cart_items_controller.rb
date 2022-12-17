class Public::CartItemsController < ApplicationController
 def index
  @cart_items = current_customer.cart_items
  @total = 0
  @cart_items = CartItem.all
 end

 # def create
 #  1. 追加した商品がカート内に存在するかの判別
 #    存在した場合
 #      2. カート内の個数をフォームから送られた個数分追加する
 #    存在しなかった場合
 #      カートモデルにレコードを新規作成する
 # end

 def create
  1. 追加した商品がカート内に存在するかの判別
    存在した場合
      2. カート内の個数をフォームから送られた個数分追加する
    存在しなかった場合
      カートモデルにレコードを新規作成する
 end

 def destroy_all
  current_customer.cart_items.destroy_all
  redirect_to cart_items_path
 end

 def destroy
  current_customer.cart_item.destroy
  respond_to do |format|
    redirect_to cart_id_path(@cart_item), notice: '商品をカートから削除しました。'
    end
end



private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end


end
