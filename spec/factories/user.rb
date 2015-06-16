FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@email.com"
  end

  factory :user do
    email
    password 'password'
  end
end
