class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :labelings, as: :labelable
  has_many :labels, through: :labelings


  scope :visible_to, -> (user) { user ? all : where(public: true) }

  validates :name, length: {minimum: 5 }, presence: true
  validates :description, length: {minimum: 15 }, presence: true
end
