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
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    forum_id = params[:forum][:id]

    @forum = Forum.find_by id: forum_id


    if @forum
      @topic.forum_id = forum_id
      if @topic.save
        redirect_to forum_show_path(@forum)
      else
      end
    else
      redirect_to root_path
    end

    # if @topic.save
    #   redirect_to forum_show_path(Forum.find(params[:forum][:id]))
    # else
    # end
  end


  private

    def topic_params
      params.require(:topic).permit(:subject)
    end
end
