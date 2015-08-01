class Topic < ActiveRecord::Base
  belongs_to :user
  belongs_to :forum
  has_many :posts, dependent: :destroy
  accepts_nested_attributes_for :posts

  validates :subject, presence: true

  self.per_page = 20

  def self.op?(topic, post)
    op = topic.posts.first
    if op == post
      return true
    end
    false
  end
end
