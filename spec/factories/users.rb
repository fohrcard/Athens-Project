FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password "secret123"
    password_confirmation "secret123"
    age "13-17"
    country "US"
    gender "Male"
    flag 0
  end
end
