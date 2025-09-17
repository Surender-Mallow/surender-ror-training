FactoryBot.define do
  factory :company do
    name { Faker::FunnyName.unique.name }
    description { Faker::GreekPhilosophers.quote }
  end
end
