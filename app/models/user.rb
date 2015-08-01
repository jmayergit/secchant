class User < ActiveRecord::Base
  has_many :posts
  has_many :topics
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:user_name]

  validates_presence_of :user_name
  validates_uniqueness_of :user_name

  def self.format_date(datetime)
    datetime = datetime.to_s
    regex = /[[:digit:]]{4}-{1}[[:digit:]]{2}-[[:digit:]]{2}/
    regex.match(datetime).to_s
  end
end
