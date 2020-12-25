FactoryBot.define do
  factory :tweet do
    title { Faker::Lorem.characters(number: 10) }
    description { Faker::Lorem.characters(number: 10) }
    recommended { 3 }
    flower_name { "勿忘草" }
    prefecture_id { 2 }
    city { "東京都" }
    shop_name { "フラワーショップ" }
    user_id { 1 }
    created_at { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    association :user 
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end