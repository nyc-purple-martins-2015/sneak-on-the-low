class Question < ActiveRecord::Base
  include UserRelationships

  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :answers
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
  has_many :question_tags
  has_many :tags, through: :question_tags

  validates_presence_of :title, :content, :author
end
