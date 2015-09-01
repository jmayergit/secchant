class Forum < ActiveRecord::Base
  has_many :topics

  '''
  Prints forum name
  '''
  def get_name
    name = self.name

    if self.team_forum
      name += " Sports Board"
    end

    return name
  end
end
