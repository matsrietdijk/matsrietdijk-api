FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name(nil, %w(_)) }
    password { Faker::Internet.password }
  end
end
