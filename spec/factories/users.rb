FactoryBot.define do
  factory :user do
    login { Faker::Internet.unique.username(nil, %w[. _ -]) }
    name { Faker::Name.unique.name }
    url { Faker::Internet.url('example.com') }
    avatar_url { Faker::Avatar.image }
    provider { 'github' }
  end
end
