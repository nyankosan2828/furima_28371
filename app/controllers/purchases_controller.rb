class PurchasesController < ApplicationController
  # 商品購入ページ
  def index
    @item = Item.find(params[:item_id])
    @purchase = PurchaseShipment.new
  end

  # 購入者情報の保存
  def create
    @item = Item.find(params[:item_id])
    @purchase = PurchaseShipment.new(purchase_params)
    if @purchase.valid?
      pay_item(card_params)
      @purchase.save
      @item.update(purchase_status: true)
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipment).permit(:postal_code, :prefecture_id, :city, :street_number, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def card_params
    params.permit(:token)
  end

  def pay_item(card_params)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: card_params[:token],
      currency:'jpy'
    )
  end

end
