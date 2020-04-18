FactoryBot.define do
  factory :user do
    password              {"00000000"}
    password_confirmation {"00000000"}
    sequence(:email)      {Faker::Internet.email}
    sequence(:nickname)   {Faker::Name.last_name}
  end

  factory :another_user, class: User do
    nickname {"tanaka"}
    email    {"uuu@example.com"}
  end

  factory :error_user, class: User do
    nickname {"error"}
    email    {"error"}
  end
end
