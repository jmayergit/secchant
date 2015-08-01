class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @topic = Topic.find(params[:topic_id])
    @reply_post = Post.find(params[:reply_id])
    @post = @topic.posts.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @reply_post = Post.find(params[:reply_post][:id])
    @post = @topic.posts.new(posts_params)
    @post.user_id = current_user.id

    if @post.save
      new_replies = Post.new_replies(@reply_post, @post.id)
      @reply_post.update(replies: new_replies)

      redirect_to topic_show_path(@topic)
    else
    end
  end

  def edit

  end

  def update
    
  end

  private

  def posts_params
    params.require(:post).permit(:message, :user_id)
  end
end
