FactoryGirl.define do

  factory :message do
    body     Faker::Friends.quote
    image    Faker::LoremPixel.image
    group_id Faker::Number.between(1, 10)
    user_id  Faker::Number.between(1, 10)
  end
end
