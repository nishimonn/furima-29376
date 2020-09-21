class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :items_condition
  belongs_to_active_hash :shipping_fee_burden
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :days_until_shipping

  with_options presence: true do
    validates :items_name, :items_description, :selling_price, :user_id, :category_id, :items_condition_id, :shipping_fee_burden_id, :shipping_region_id, :days_until_shipping_id
  end

  with_options numericality: { other_than: 1} do
  validates :category_id, :items_condition_id, :shipping_fee_burden_id, :shipping_region_id,:days_until_shipping_id
  end
  
  validates :selling_price, numericality: {with: /\A[0-9]+\z/}

end
