class Admin::ItemsController < ApplicationController

  def new
   @name = "商品名"
   @introduction = "ここに説明文を記述します"
   @tax = "1000"
   @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.save
    @post_image = PostImage.new(post_image_params)
    @post_image.admin_id = current_admin_id
    @post_image.save
    redirect_to post_images_path
  end

  def index
  @items = Item.all
  @post_images = XXX
  end

  def show
  @post_image = PostImage.new
  @item = Item.find(params[:id])
  end

  # def destroy
  #   @post_image = PostImage.
  #   @post_image.削除
  #   redirect_to PostImageの一覧ページへのパス

  #   list = List.find(params[:id])  # データ（レコード）を1件取得
  #   list.destroy  # データ（レコード）を削除
  #   redirect_to '/lists'
  # end


def edit
  @item = Item.find(params.id)
  @post_image = PostImage.find(params.id)
end




  private
  def item_params
    params.require(:item, :post_image).permit(:profile_image, :name, :introduction, :genre_id, :price, :is_active)
  end


  end
