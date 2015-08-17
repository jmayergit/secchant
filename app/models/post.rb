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

  def self.create_description(post)
    post.created_at.to_s + "\n" + post.user.user_name
  end

  '''
  Finds a posts index relative to other posts in topic

  Used in Forum show page to navigate to last post and
  in User posts index to navigate to a post that is not
  necessarily last -- requiring iteration
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
