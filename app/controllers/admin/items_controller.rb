class Admin::ItemsController < ApplicationController

  def new
   @name = "（商品名を入れる）"
   @introduction = "（ここに説明文を記述します）"
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to '/about'
  end


  def index
  @items = Item.all
  end

    private
    # ストロングパラメータ

  end
