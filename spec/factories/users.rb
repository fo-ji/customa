FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
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
