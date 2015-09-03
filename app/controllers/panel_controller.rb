class PanelController < ApplicationController
  before_action :authenticate_admin!

  def show
    @users = User.all

    @topics = Topic.all

    @posts = Post.all

    @comments = Comment.all
  end

  def mod
    @user = User.find(params["user"]["id"])
    if @user.moderator == true
      @user.update(moderator: false)
    else
      @user.update(moderator: true)
    end

    redirect_to admin_panel_path
  end

  def ban
    @user = User.find(params["user"]["id"])

    if @user.banned
      @user.update(banned: false)
    else
      @user.update(banned: true)
      @user.update(moderator: false)
    end

    redirect_to admin_panel_path
  end
end
