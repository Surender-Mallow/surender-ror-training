FactoryBot.define do
  factory :job do
    company

    title { Faker::FunnyName.unique.name }
    description { Faker::GreekPhilosophers.quote }
    location { Faker::Address.country }
    salary { Faker::Number.number(digits: 7) }
    status { Faker::Name.name }
  end
end
