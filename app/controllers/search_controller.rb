class SearchController < ApplicationController
  def topic
    @user = User.find(params[:user])

    @topics = @user.topics.page(params[:page])
  end

  def post
    @user = User.find(params[:user])

    @posts = @user.posts.page(params[:page])
  end
end
