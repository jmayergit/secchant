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




  '''
  Extracts the month as Fixnum from a DateTime instance
  '''
  def self.parse_month(datetime)
    datetime = datetime.to_s if datetime.class != String
    regex = /-{1}[[:digit:]]{2}/
    matchData = regex.match(datetime).to_s

    if matchData[1] == "0"
      month = matchData[2].to_i
    elsif matchData[1] != "0"
      month = matchData[1..-1].to_i
    else
      "What!"
    end
  end


  '''
  Parses the year as String from a DateTime instance
  '''
  def self.parse_year(datetime)
    datetime = datetime.to_s if datetime.class != String
    regex = /[[:digit:]]{4}/
    matchData = regex.match(datetime)

    year = matchData.to_s
  end


  '''
  Takes the parameter of a DateTime instance (in this case
  the created_at attribute of any given User) and converts
  to a more semantic description -- e.g. Member since Aug 2015
  '''
  def self.get_semantic(datetime)
    datetime = datetime.to_s

    months = ["Jan", "Feb", "Mar", "Apr",
      "May", "Jun", "Jul", "Aug", "Sep",
      "Oct", "Nov", "Dec"]

    index = parse_month(datetime)
    month = months[index]

    year = parse_year(datetime)

    "Member since " + month + " " + year
  end


end
