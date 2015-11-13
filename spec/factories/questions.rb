require 'faker'

FactoryGirl.define do
  factory :question do
    title {Faker::Lorem.word}
    content {Faker::Lorem.sentence}
    author {FactoryGirl.create(:user)}
  end

end
