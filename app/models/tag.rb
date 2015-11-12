class Tag < ActiveRecord::Base
  has_many :question_tags
  has_many :tags, through: :question_tags
end
