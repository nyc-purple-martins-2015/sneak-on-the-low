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
    old_tag_names = question.tags.map(&:name)
    new_tag_names = tags.split(", ").uniq
    tags_array = new_tag_names - old_tag_names
    tags_to_disassociate = old_tag_names - new_tag_names
    tags_to_disassociate.each do |tag|
      old_tag = Tag.find_by(name: tag)
      qtag = QuestionTag.find_by(question_id: question.id, tag_id: old_tag.id)
      qtag.destroy
    end
    tags_array.each do |new_tag|
      existing_tags = Tag.find_by(name: new_tag)
      if existing_tags
        question.tags.push(existing_tags)
      else
        question.tags.create(name: new_tag)
      end
    end
  end

end

