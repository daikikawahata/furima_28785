FactoryBot.define do
  factory :user do
    family_name {"川畑"}
    first_name {"大輝"}
    family_name_furigana {"カワハタ"}
    first_name_furigana {"ダイキ"}
    nickname {"daiki"}
    birth_day {"2001-04-26"}
    email {Faker::Internet.free_email}
    password {"abc123"}
    password_confirmation {"abc123"}
  end
end