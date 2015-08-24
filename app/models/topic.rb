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
  def self.to_central(militaryTime)
    hour = militaryTime[0..1]
    puts 'hour: ' + hour
    hours = ['00','01','02','03','04','05','06','07','08','09','10','11','12',
      '13','14','15','16','17','18','19','20','21','22','23']

    i = 0
    while i < hours.length
      puts "i: " + i.to_s
      break if hours[i] == hour
      i += 1
    end

    i -= 7

    central_hour = hours[i]

    central_time = central_hour + militaryTime[-3..-1]
  end


  '''
  Prints the last_post_created_at attribute
  for a given topic -- e.g. 3:45 PM
  '''
  def self.print_lpca(topic)
    lpca = topic.last_post_created_at.to_s
    regex = /[[:digit:]]{2}:{1}[[:digit:]]{2}/
    militaryTime = regex.match(lpca).to_s

    centralTime = to_central(militaryTime)

    semantic_lpca = to_ampm(centralTime)
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
