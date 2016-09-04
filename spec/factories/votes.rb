FactoryGirl.define do
  factory :vote do
    user nil
    post nil
    image_one { [true, false].sample }
  end
end
