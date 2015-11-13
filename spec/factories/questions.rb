FactoryGirl.define do

  factory :question do
    question = user.questions.create(title: Faker::Book.title, content: Faker::Lorem.paragraph(1))
    title Faker::Book.title
    content Faker::Lorem.paragraph(1)
    author User.create(username: "nick", email: "nick@gmail.com", password: "password")
  end

end
