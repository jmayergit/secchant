class ForumsController < ApplicationController
  # outside of major site re-implementation forums are static
  def show
    @forum = Forum.find(params[:id])
  end
end
