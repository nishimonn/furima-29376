require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
  end

  describe '商品出品機能'
  it '全ての値が正常であれば出品ができる' do
    expect(@item).to be_valid
  end

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


  it '299円以下の場合は出品ができない' do
    @item.selling_price = '299'
    @item.valid?
    expect(@item.selling_price).to be >= 299
  end

  it '10,000,000円以上の場合は出品ができない' do
    @item.selling_price = '10000000'
    @item.valid?
    expect(@item.selling_price).to be <= 10000000
  end

  it '販売価格は半角数字のみ入力可能であること' do
    @item.selling_price = 'aaa'
    @item.valid?
    expect(@item.errors.full_messages).to include("Selling price is not a number")
  end

  it '画像は1枚必須であること' do
    @item.image = nil
    expect(@item).to be_valid
  end

  it "item.category_idが1では出品できないこと" do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Category must be other than 1")
  end

  it "items_condition_idが1では出品できないこと" do
    @item.items_condition_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Items condition must be other than 1")
  end

  it "shipping_fee_burden_idが1では出品できないこと" do
    @item.shipping_fee_burden_id = 1
    @item.valid?
  expect(@item.errors.full_messages).to include("Shipping fee burden must be other than 1")
  end

  it "shipping_region_idが1では出品できないこと" do
    @item.shipping_region_id = 1
    @item.valid?
  expect(@item.errors.full_messages).to include("Shipping region must be other than 1")
  end

  it "days_until_shipping_idが1では出品できないこと" do
    @item.days_until_shipping_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Days until shipping must be other than 1")
  end

end
