class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :move_to_index, except: [:index, :show]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  # createをしたい。保存したい値が送信されていなければならない。
  # 送信=>form_with,うまくいってるかどうか？=>うまくいってそう。f.text_area :items_name
  # 受信=>?, 「受信の方法？」,binding.pryカリキュラムを読み直す。
  # 受信ができていないために、その記述を変更する。
  # 再度newのページで値を入力して保存する。=>?

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:items_name, :items_description, :category_id, :items_condition_id, :shipping_fee_burden_id, :shipping_region_id, :days_until_shipping_id, :days_until_shipping_id, :selling_price, :image).merge(user_id: current_user.id)
  end
end
