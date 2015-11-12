class Answer < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :question
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  validates_presence_of :content, :author
end
