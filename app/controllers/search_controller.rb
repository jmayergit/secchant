class SearchController < ApplicationController
  def topic
    @user = User.find(params[:user])

    @topics = @user.topics.page(params[:page])
  end

  def post
    @user = User.find(params[:user])

    @posts = @user.posts.page(params[:page])
  end

  def reply
    @post = Post.find(params[:post])
    @topic = @post.topic

    @replies = []
    replies = @post.replies.split(",")
    replies.each do |reply|
      @replies.insert(-1,Post.find(reply))
    end
  end
end
