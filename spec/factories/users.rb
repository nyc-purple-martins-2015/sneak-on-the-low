FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "email#{n}@gmail.com"}
    sequence(:username) {|n| "user#{n}"}
    password "password"
  end

end
