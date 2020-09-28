class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @item = Item.find(params[:item_id])
    @shipping_address = UserShippingAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @shipping_address = UserShippingAddress.new(shipping_addresses_params)
     if @shipping_address.valid?
        @shipping_address.save
        redirect_to root_path
     else
       render :index
     end
  end

  private

  def shipping_addresses_params
    params.require(:user_shipping_address).permit(:postal_code, :prefectures_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def order_params
    params.permit(:price, :token)
  end
 
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end