FactoryBot.define do
  factory :user_shipping_address do
    token {'aaaa'}
    postal_code {'111-1111'}
    prefectures_id {'2'}
    city {'北九州市'}
    address {'11番'}
    building_name {'西ビル'}
    phone_number {'09012345678'}
  end
end
