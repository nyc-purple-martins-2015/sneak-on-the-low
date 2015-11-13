class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :username, :email, :password_digest
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_uniqueness_of :email, :username
  validates_confirmation_of :password
  has_many :answers
  has_many :questions
  has_many :comments
  has_many :votes
end
