FactoryGirl.define do
  factory :item do
    name Faker::Book.title
    description Faker::Lorem.sentence
    image_url Faker::Placeholdit.image
  end

end
