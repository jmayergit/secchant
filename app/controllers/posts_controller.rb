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

      if !@topic.anchored
        @topic.update(last_post_created_at: DateTime.now)
      end

      redirect_to topic_show_path(@topic, :page => Post.find_page(@post), :anchor => "post-#{@post.id}")
    else
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(posts_params)
      redirect_to topic_show_path(@post.topic)
    else
      flash[:error] = "Unable to update post."
      redirect_to root_path
    end
  end

  private

  def posts_params
    params.require(:post).permit(:message, :user_id)
  end
end
