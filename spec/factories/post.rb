FactoryGirl.define do
  factory :post do
    user
    topic

    sequence(:message, 1)  { |n| "I have posted #{n} time(s)"}
  end
end
