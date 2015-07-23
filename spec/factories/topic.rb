FactoryGirl.define do
  factory :topic do
    user
    forum

    sequence(:subject, 1) { |n| "Topic \##{n}"}
  end
end
