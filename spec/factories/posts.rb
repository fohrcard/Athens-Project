FactoryGirl.define do
  factory :post do
    user nil
    image_one {%w(https://unsplash.it/1080/1080/?random https://unsplash.it/1080/1350/?random https://unsplash.it/1080/566/?random).sample}
    image_two {%w(https://unsplash.it/1080/1080/?random https://unsplash.it/1080/1350/?random https://unsplash.it/1080/566/?random).sample}
  end
end
