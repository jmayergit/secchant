class ForumsController < ApplicationController
  # outside of major site re-implementation forums are static
  def show
    @forum = Forum.find(params[:id])
    @topics = @forum.topics.order(:stickied).order(created_at: :asc).page(params[:page])
  end
end
