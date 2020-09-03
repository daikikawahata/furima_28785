FactoryBot.define do
  factory :shipping_address do
    postal_code   { '123-4567' }
    prefecture_id { 1 }
    city          { '練馬区' }
    house_number  { '石神井町8-1-19' }
    building_name { '102' }
    phone_number  { '09012345678' }
    association :buyer
  end
end
