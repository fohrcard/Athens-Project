FactoryGirl.define do
  factory :post do
    user nil
    image_one {Faker::Avatar.image("image_one")}
    image_two {Faker::Avatar.image("image_two")}
  end
end
