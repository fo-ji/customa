FactoryBot.define do
  factory :client do
    company_name      {"森下仁丹株式会社"}
    email             {"jintan@gmail.com"}
    responsible_party {"田中"}
    postal_code       {"123-4567"}
    address           {"東京都千代田区神田1-1"}
    phone_number      {"03-1234-5678"}
    user_id           {"1"}
    user

    trait :invalid do
      company_name    {""}
    end
  end
end
