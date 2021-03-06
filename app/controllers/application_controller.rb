class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_forums, only: [:new, :show, :edit, :update, :home, :topic, :post, :reply, :user]

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:user_name, :email, :password, :password_confirmation) }
  end

  def get_forums
    @secForums = Forum.where(team_forum: false)
    @teamForums = Forum.where(team_forum: true)

    @helpForum = Forum.find_by(name: "Help Board")
  end
end
