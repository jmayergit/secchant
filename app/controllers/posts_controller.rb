class PostsController < ApplicationController
  before_action :authenticate_user_custom, except: [:show, :destroy, :upvote, :downvote]
  before_action :authenticate_admin!, only: :destroy

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

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:success] = "Post Successfully Destroyed"
      redirect_to admin_panel_path
    else
      flash[:error] = "Post Was Not Destroyed"
      redirect_to admin_panel_path
    end
  end

  def upvote
    @post = Post.find(params[:id])
    upvotes = @post.upvotes += 1

    @post.update(upvotes: upvotes)

    redirect_to topic_show_path(@topic, :page => Post.find_page(@post), :anchor => "post-#{@post.id}")
  end

  def downvote
    @post = Post.find(params[:id])
    downvotes = @post.downvotes += 1

    @post.update(downvotes: downvotes)

    redirect_to topic_show_path(@topic, :page => Post.find_page(@post), :anchor => "post-#{@post.id}")
  end

  private

  def posts_params
    params.require(:post).permit(:message, :user_id)
  end

  def authenticate_user_custom
    if !user_signed_in?
      flash[:error] = "You must create an account or be logged in to post"

      redirect_to new_user_session_path
    elsif current_user.banned
      flash[:error] = "Yo azz has lost some privileges :/ Feel free to vote though!"

      redirect_to "/"
    end
  end
end
