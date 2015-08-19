class Topic < ActiveRecord::Base
  belongs_to :user
  belongs_to :forum
  has_many :posts, dependent: :destroy
  accepts_nested_attributes_for :posts
  before_create :set_last_post_created_at_to_now

  validates :subject, presence: true

  self.per_page = 20


  '''
  Converts military time into AM/PM
  '''
  def self.to_ampm(militaryTime)
    am = false
    pm = false
    minutes = militaryTime[-2..-1]
    hours = militaryTime[0..1].to_i

    if hours >= 13
      pm = true

      hours = hours - 12
    elsif hours <= 12
      am = true
    else
      "What!"
    end

    ampm_time = hours.to_s + ":" + minutes

    if am == true
      ampm_time = ampm_time + " AM"
    elsif pm == true
      ampm_time = ampm_time + " PM"
    end
  end


  '''
  Converts UTC to central time
  '''
  def self.to_central
  end


  '''
  Takes a Topic instance and returns a semantic version
  of its attribute last_post_created_at -- e.g.
  '''
  def self.semanticize_lpca(topic)
    lpca = topic.last_post_created_at.to_s
    regex = /[[:digit:]]{2}:{1}[[:digit:]]{2}/
    militaryTime = regex.match(lpca).to_s

    semantic_lpca = to_ampm(militaryTime)
  end


  '''
  '''
  def self.op?(topic, post)
    op = topic.posts.first
    if op == post
      return true
    end
    false
  end


  '''
  '''
  def set_last_post_created_at_to_now
    self.last_post_created_at = DateTime.now()
  end
end
