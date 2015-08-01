class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic

  def self.new_replies(post, reply_id)
    replies = post.replies
    if replies == nil
      replies = "#{reply_id}"
    else
      replies += ",#{reply_id}"
    end
  end
end
