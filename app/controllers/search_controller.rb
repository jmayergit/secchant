class SearchController < ApplicationController
  def topic
    @user = User.find(params[:user])

    @topics = @user.topics
  end

  def post
    @user = User.find(params[:user])

    @posts = @user.posts
  end
end
