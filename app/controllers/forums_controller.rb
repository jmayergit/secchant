class ForumsController < ApplicationController
  # outside of major site re-implementation forums are static
  def show
    @forum = Forum.find(params[:id])
    @topics = @forum.topics.order(stickied: :desc).order(last_post_created_at: :desc).page(params[:page])
  end
end
