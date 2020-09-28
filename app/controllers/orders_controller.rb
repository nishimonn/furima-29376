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
end