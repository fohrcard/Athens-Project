FactoryGirl.define do
  factory :user do
    email "email@example.com"
    password "MyString"
    password_confirmation "MyString"
    age "13-17"
    country "US"
    gender "Male"
    flag 0
  end
end
