FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    explanation {Faker::Lorem.sentence}
    category_id {2}
    condition_id {2}
    pay_postage_id {2}
    prefecture_id {2}
    shipping_date_id {2}
    price {5000}
    association :user
  end
end