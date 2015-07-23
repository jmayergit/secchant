class TopicsController < ApplicationController
  def new
    @secForums = Forum.where(team_forum: false)
    @teamForums = Forum.where(team_forum: true)
    @forum = Forum.find(params[:forum])


    @topic = Topic.new
  end

  def create
  end
end
