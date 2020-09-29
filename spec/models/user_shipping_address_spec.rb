require 'rails_helper'

RSpec.describe UserShippingAddress, type: :model do
  describe '配送先の保存' do
    before do
      @user_shipping_address = FactoryBot.build(:user_shipping_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_shipping_address).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @user_shipping_address.postal_code = nil
      @user_shipping_address.valid?
      expect(@user_shipping_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @user_shipping_address.postal_code = '1234567'
      @user_shipping_address.valid?
      expect(@user_shipping_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'prefecture_idを選択していないと保存できないこと' do
      @user_shipping_address.prefectures_id = 0
      @user_shipping_address.valid?
      expect(@user_shipping_address.errors.full_messages).to include("Prefectures can't be blank")
    end
    it 'building_nameは空でも保存できること' do
      @user_shipping_address.building_name = nil
      expect(@user_shipping_address).to be_valid
    end
    it 'phone_numberが空だと保存できないこと' do
      @user_shipping_address.phone_number = nil
      @user_shipping_address.valid?
      expect(@user_shipping_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが全角数字だと保存できないこと' do
      @user_shipping_address.phone_number = '０９０１２３４５６７８'
      @user_shipping_address.valid?
      expect(@user_shipping_address.errors.full_messages).to include("Phone number is invalid. Input half-width characters.")
    end
  end
end
