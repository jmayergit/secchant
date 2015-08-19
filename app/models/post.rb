class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic

  self.per_page = 20

  def self.new_replies(post, reply_id)
    replies = post.replies
    if replies == nil
      replies = "#{reply_id}"
    else
      replies += ",#{reply_id}"
    end
  end


  '''
  Topics are paginated -- this methods finds the page a post is on
  '''
  def self.find_page(aPost)
    posts = aPost.topic.posts.order(:created_at)
    i = 0
    for post in posts
      if post == aPost
        break
      else
        i += 1
      end
    end

    page = (i / self.per_page) + 1
    return page
  end
end
