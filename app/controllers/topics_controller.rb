class TopicsController < ApplicationController
  def new
    @secForums = Forum.where(team_forum: false)
    @teamForums = Forum.where(team_forum: true)

    @forum = Forum.find(params[:forum])
    @topic = Topic.new
    @topic.id = @forum.id
  end

  def create
    puts '-'*100
    puts params
    puts '-'*100
  end
end
