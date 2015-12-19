class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :SponsoredPost, dependent: :destroy

  validates :name, length: {minimum: 5 },
  validates :description, length: {minimum: 15 }
  validates :user, presence: true

end
