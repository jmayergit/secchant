class TopicsController < ApplicationController
  def new
    @secForums = Forum.where(team_forum: false)
    @teamForums = Forum.where(team_forum: true)

    if !params[:forum]
      redirect_to root_path
    else
      @forum = Forum.find(params[:forum])
    end

    @topic = Topic.new
  end

  def create
    @topic = Topic.new(params[:topic])
    @topic.user_id = current_user.id

    if @topic.save
      redirect_to forum_show_path(Forum.find(params[:topic][:forum_id]))
    else
    end
  end


  private

    def topic_params
      params.require(:topic).permit(:subject, :forum_id)
    end
end
