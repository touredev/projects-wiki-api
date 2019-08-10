FactoryBot.define do
  factory :access_token do
    token { Faker::Crypto.sha256 }
    user
  end
end
