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
    puts '-'*100
    puts params
    puts '-'*100
  end
end
