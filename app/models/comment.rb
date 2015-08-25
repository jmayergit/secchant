class Comment < ActiveRecord::Base
  belongs_to :art
  belongs_to :user

  '''
  Instance method that checks if comment belongs to user paramter
  '''
  def belongs_to(user)
    if self.user_id == user.id
      return true
    elsif self.user_id != user.id
      return false
    else
      "WHAT!"
    end
  end
end
