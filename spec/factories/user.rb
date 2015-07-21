FactoryGirl.define do
  factory :user do
    sequence(:email, 1000) { |n| "user#{n}@domain.com"}
    user_name 'aUsername'
    password 'aPassword'

    factory :user_with_posts do
      transient do
        posts_count 5
      end

      after(:create) do |user, evaluator|
        create_list(:post, evaluator.posts_count, user: user)
      end
    end
  end
end
