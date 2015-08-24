class WelcomeController < ApplicationController
  def home
    @arts = Art.all
  end
end
