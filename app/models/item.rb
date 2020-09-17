class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :items_condition
  belongs_to_active_hash :shipping_fee_burden
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :days_until_shipping

  

end
