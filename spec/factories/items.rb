FactoryBot.define do
  factory :item do
    items_name { 'イチゴ' }
    items_description { '美味しい' }
    category_id { '2' }
    items_condition_id { '2' }
    shipping_fee_burden_id { '2' }
    shipping_region_id { '2' }
    days_until_shipping_id { '2' }
    selling_price { '500' }
    association :user

  end
end
