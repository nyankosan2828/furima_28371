class ItemsController < ApplicationController
  before_action :move_to_session, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]

  # トップページ
  def index
    @items = Item.all.order(created_at: 'DESC')
  end

  # 商品出品ページ
  def new
    @item = Item.new
  end

  # 商品出品時のデータ保存
  def create
    @item = Item.new(item_params)
    if @item.save
      @item.update(purchase_status: false)
      redirect_to root_path
    else
      render action: :new
    end
  end

  # 商品詳細ページ
  def show
  end

  # 商品編集ページ
  def edit
    redirect_to root_path unless current_user == @item.user
  end

  # 商品情報の更新
  def update
    render action: :show if @item.update(item_params)
  end

  private

  def move_to_session
    redirect_to new_user_session_path unless user_signed_in?
  end

  # idに紐づく商品データの取得
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :price, :category_id, :status_id, :shipping_fee_id, :shipping_origin_id, :shipping_date_id).merge(user_id: current_user.id)
  end
end
