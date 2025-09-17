FactoryBot.define do
  factory :user do
    business
    
    first_name { Faker::FunnyName.unique.name }
    last_name { Faker::FunnyName.unique.name }
    email { Faker::Internet.unique.email }
    type { rand(0..1) }
  end
end
