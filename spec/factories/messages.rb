FactoryGirl.define do

  factory :message do
    body     Faker::Friends.quote
    image    Faker::LoremPixel.image
  end
end
