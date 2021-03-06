FactoryBot.define do
  factory :user do
    nick_name { 'にし'}
    family_name {'西本'}
    family_name_kana {'ニシモト'}
    first_name {'将'}
    first_name_kana {'ショウ'}
    email {Faker::Internet.free_email}
    password {'123456'}
    password_confirmation {password}
    birthday {'1990-01-01'}
  end
end
