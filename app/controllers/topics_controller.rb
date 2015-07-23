class TopicsController < ApplicationController
  def new
    @secForums = Forum.where(team_forum: false)
    @teamForums = Forum.where(team_forum: true)
    puts "-------" * 10
    puts params
    puts "-------" * 10


    @topic = Topic.new
  end

  def create
  end
end
