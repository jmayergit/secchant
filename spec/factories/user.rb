FactoryGirl.define do
  factory :user do
    sequence(:email, 1000) { |n| "user#{n}@domain.com"}
    password 'ssshhhhhh'
  end
end
