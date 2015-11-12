class Comment < ActiveRecord::Base
  belongs_to :commentor, class_name: 'User', foreign_key: :user_id
  belongs_to :commentable, polymorphic: true

  validates_presence_of :content

end
