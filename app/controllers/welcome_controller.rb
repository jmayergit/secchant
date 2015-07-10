class WelcomeController < ApplicationController
  def home
    @rant = Forum.find_by name:'SEC Rant'
    @recruiting = Forum.find_by name:'SEC Recruiting'
    @tickets = Forum.find_by name:'SEC Tickets'
    @offtopic = Forum.find_by name:'Off-Topic Board'
    @help = Forum.find_by name:'Help Board'
  end
end
