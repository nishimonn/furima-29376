require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能'

  it '商品名が必須であること' do
    @item.items_name = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Items name can't be blank")
  end
  it '商品の説明が必須であること' do
    @item.items_description = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Items description can't be blank")
  end
  it 'カテゴリーの情報が必須であること' do
    @item.category_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end
  it '商品の状態についての情報が必須であること' do
    @item.items_condition_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Items condition can't be blank")
  end
  it '配送料の負担についての情報が必須であること' do
    @item.shipping_fee_burden_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping fee burden can't be blank")
  end
  it '発送元の地域についての情報が必須であること' do
    @item.shipping_region_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping region can't be blank")
  end
  it '発送までの日数についての情報が必須であること' do
    @item.days_until_shipping_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Days until shipping can't be blank")
  end
  it '価格についての情報が必須であること' do
    @item.selling_price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Selling price can't be blank")
  end
end
