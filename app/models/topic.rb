class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :SponsoredPost, dependent: :destroy

  validates :name, length: {minimum: 5 }, presence: true
  validates :description, length: {minimum: 15 }, presence: true


end
