class Tag < ActiveRecord::Base
  has_many :question_tags
  has_many :questions, through: :question_tags

  def self.seperate_tags(tags, question)
    tags_array = tags.split(", ").uniq
    tags_array.each do |new_tag|
      existing_tags = Tag.find_by(name: new_tag)
      if existing_tags
        question.tags.push(existing_tags)
      else
        question.tags.create(name: new_tag)
      end
    end
  end

  def self.seperate_new_tags(tags, question)
    question.question_tags.delete_all
    seperate_tags(tags, question)
  end

end

