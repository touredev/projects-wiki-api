FactoryBot.define do
  factory :project do
    name { Faker::App.unique.name }
    description { Faker::Lorem.paragraph }
    techs_stack { Faker::ProgrammingLanguage.name }
    current_version { Faker::App.version }
    link { Faker::Internet.url }
  end
end
