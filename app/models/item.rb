class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :items_condition
  belongs_to_active_hash :shipping_fee_burden
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :days_until_shipping

  with_options presence: true do
    validates :items_name, :tems_description, :selling_price, :user
  end
  validates :category_id, numericality: { other_than: 1 } 
  validates :items_condition_id, numericality: { other_than: 1 } 
  validates :shipping_fee_burden_id, numericality: { other_than: 1 } 
  validates :shipping_region_id, numericality: { other_than: 1 } 
  validates :days_until_shipping_id, numericality: { other_than: 1 } 

end
