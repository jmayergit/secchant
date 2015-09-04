class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic

  self.per_page = 20


  '''
  Counts the number of replies a post has
  '''
  def count_replies
    if self.replies == nil
      count = 0
    else
      count = self.replies.split(",").length
    end
  end


  '''
  Prints the replies, e.g. Replies (2)
  '''
  def print_replies
    count = self.count_replies

    "Replies (" + count.to_s + ")"
  end


  '''
  '''
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


  '''
  Prints the forum name of a post
  '''
  def get_forum_name
    forum = self.topic.forum
    name = forum.name
    if forum.team_forum
      name += " Sports Board"
    end

    return name
  end


  '''
  '''
  def self.print_sanitize_msg(post)
    message = post.message
    cusswords = [/shit/,/fuck/,/piss/]

    cusswords.each do |cuss|
      message.gsub!(cuss, "naughty word")
    end

    message


  end
end
