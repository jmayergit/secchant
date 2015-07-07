FactoryGirl.define do
  factory :admin do
    sequence(:email, 1000) { |n| "admin#{n}@domain.com"}
    password 'ssshhhhhh'

    trait :god_mode do
      god_mode true
    end

    factory :admin_god_mode, traits: [:god_mode]
  end
end
