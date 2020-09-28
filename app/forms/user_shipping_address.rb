class UserShipping_address

  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :city, :address, :building_name, :phone_number, :buy

  with_options presence: true do
    #「郵便番号」のバリデーション
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    #「市区町村」のバリデーション
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    #「番地」のバリデーション
    validates :address, format: { with: /\A[ぁ-んァ-ン一-龥0-9]+\z/, message: "is invalid. Input full-width characters."}
    #「電話番号」のバリデーション
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
  end
  #「建物名」のバリデーション
  validates :building_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
  # 「都道府県」のバリデーション
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

end