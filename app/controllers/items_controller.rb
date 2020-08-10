class ItemsController < ApplicationController
before_action :move_to_session, except: [:index]

  # トップページ
  def index
  end

  # 商品出品ページ
  def new
    @item = Item.new
  end

  # 商品出品時のデータ保存
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private

  def move_to_session
    redirect_to new_user_session_path unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :price, :category_id, :status_id, :shipping_fee_id, :shipping_origin_id, :shipping_date_id).merge(user_id: current_user.id)
  end
end
