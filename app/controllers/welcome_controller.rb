class WelcomeController < ApplicationController
  def home
    # for ContentL navigation
    @secForums = Forum.where(team_forum: false)
    @teamForums = Forum.where(team_forum: true)
  end
end
