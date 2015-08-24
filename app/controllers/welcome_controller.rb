class WelcomeController < ApplicationController
  def home
    @art = Art.all
  end
end
