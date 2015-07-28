class TopicsController < ApplicationController
  before_action :require_login
  before_action :require_forum_parameter, only: [:new]
  before_action :require_forum_id_parameter, only: [:create]

  def new
    @secForums = Forum.where(team_forum: false)
    @teamForums = Forum.where(team_forum: true)

    @topic = Topic.new
    @post = @topic.posts.new
  end

  def create
    @forum = Forum.find(params[:forum][:id])
    @topic = @forum.topics.new(topic_params)
    @topic.user_id = current_user.id
    @post = @topic.posts.new
    @post.message = params[:message][:message]
    @post.user_id = current_user.id

    if @topic.save
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


  private

    def topic_params
      params.require(:topic).permit(:subject, :message)
    end

    def require_login
      unless user_signed_in?
        flash[:error] = "You must be logged on in order to post on this board."

        redirect_to new_user_session_path
      end
    end

    def require_forum_parameter
      if params[:forum]
        @forum = Forum.find(params[:forum])
      else
        flash[:error] = ";)"

        redirect_to root_path
      end
    end

    def require_forum_id_parameter
      if params[:forum][:id]
        @forum = Forum.find(params[:forum][:id])
      else
        flash[:error] = ";)"

        redirect_to root_path
      end
    end
end
