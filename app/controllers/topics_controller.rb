class TopicsController < ApplicationController
  before_action :require_login
  before_action :require_forum_parameter, only: [:new]

  def new
    @secForums = Forum.where(team_forum: false)
    @teamForums = Forum.where(team_forum: true)

    @topic = Topic.new
  end

  def create


  end


  private

    def topic_params
      params.require(:topic).permit(:subject)
    end

    def require_login
      unless user_signed_in?
        flash[:alert] = "You must be logged on in order to post on this board."

        redirect_to new_user_session_path
      end
    end

    def require_forum_parameter
      if params[:forum]
        @forum = Forum.find(params[:forum])
      else
        redirect_to root_path
      end
    end
end
