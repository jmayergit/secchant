class ForumsController < ApplicationController
  # outside of major site re-implementation forums are static
  def show
    @forum = Forum.find(params[:id])
    @topics = @forum.topics

    # for left navigation
    @secForums = Forum.where(team_forum: false)
    @teamForums = Forum.where(team_forum: true)
  end
end
