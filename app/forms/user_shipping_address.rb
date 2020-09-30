class UserShippingAddress

  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :prefectures_id, :city, :address, :building_name, :phone_number

  with_options presence: true do
    #「郵便番号」のバリデーション
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    #「市区町村」のバリデーション
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    #「番地」のバリデーション
    validates :address
    #「電話番号」のバリデーション
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
    #「トークン」のバリデーション
    validates :token
  end
  # 「都道府県」のバリデーション
  validates :prefectures_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefectures_id: prefectures_id, city: city, address: address, building_name: building_name, phone_number: phone_number, buy_id: buy.id)
  end

end