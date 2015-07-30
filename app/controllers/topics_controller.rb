class TopicsController < ApplicationController
  before_action :require_login
  before_action :require_forum_parameter, only: [:new]

  def new
    @secForums = Forum.where(team_forum: false)
    @teamForums = Forum.where(team_forum: true)

    @forum = Forum.find(params[:forum])
    @topic = Topic.new
  end

  def create
    @forum = Forum.find(params[:forum][:id])
    @topic = @forum.topics.new(topic_params)
    @topic.user_id = current_user.id
    @post = @topic.posts.new()
    @post.message = params[:topic][:posts_attributes][:message]
    @post.user_id = current_user.id

    if @topic.save && @post.save
      redirect_to forum_show_path(@forum)
    else
    end
  end

  def show
    @secForums = Forum.where(team_forum: false)
    @teamForums = Forum.where(team_forum: true)

    @topic = Topic.find(params[:id])
    @posts = @topic.posts
  end

  def edit
    @secForums = Forum.where(team_forum: false)
    @teamForums = Forum.where(team_forum: true)

    @topic = Topic.find(params[:id])
    @post = @topic.posts.first
    @forum = @topic.forum
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.posts.first.update(message: params["topic"]["post"]["message"])

    if @topic.update(topic_params)
      redirect_to topic_show_path(@topic)
    else
      redirect_to topic_edit_path(@topic)
    end
  end


  private

    def topic_params
      params.require(:topic).permit(:subject)
    end

    def require_login
      unless user_signed_in?
        flash[:error] = "You must be logged on in order to post on this board."

        redirect_to new_user_session_path
      end
    end

    def require_forum_parameter
      if params[:forum]
      else
        flash[:error] = ";)"

        redirect_to root_path
      end
    end
end
