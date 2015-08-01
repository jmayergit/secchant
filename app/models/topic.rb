class Topic < ActiveRecord::Base
  belongs_to :user
  belongs_to :forum
  has_many :posts, dependent: :destroy
  accepts_nested_attributes_for :posts

  validates :subject, presence: true
end