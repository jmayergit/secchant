class PanelController < ApplicationController
  before_action :authenticate_admin!

  def show
    @users = User.all
  end
end
