class InformationController < ApplicationController
  def index
    @posts = User.find(params[:id]).posts.page(params[:page])
  end
end
