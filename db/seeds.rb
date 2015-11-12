# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

nick = User.create(username: "nick", email: "nick@gmail.com", password: "password")
june = User.create(username: "june", email: "june@gmail.com", password: "password")
tahrim = User.create(username: "tahrim", email: "tahrim@gmail.com", password: "password")
andre = User.create(username: "andre", email: "andre@gmail.com", password: "password")

users = [nick, june, tahrim, andre]
questions = []
answers = []

tags= [Tag.create(name: "sports"), Tag.create(name: "celebs"), Tag.create(name: "music")]

users.each do |user|
  3.times do
    question = user.questions.create(title: Faker::Book.title, content: Faker::Lorem.paragraph(1))
    questions << question
    QuestionTag.create(question_id: question.id, tag_id: rand(1..3))
  end
end



users.each do |user|
  questions.each do |question|
    if question.user_id == user.id
      next
    end

    answers << Answer.create(user_id: user.id, question_id: question.id, content: Faker::Lorem.sentence(1))
  end
end
