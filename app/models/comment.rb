class Comment < ActiveRecord::Base
  belongs_to :post, polymorphic: true
  belongs_to :topic, polymorphic: true
  belongs_to :user

  has_many :posts
  has_many :topics 

  validates :body, length: {minimum: 5}, presence: true
  validates :user, presence: true
end
