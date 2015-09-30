FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    state { %w(concept published).sample }

    trait :concept do
      state 'concept'
    end

    trait :published do
      state 'published'
    end
  end
end
