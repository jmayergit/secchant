class WelcomeController < ApplicationController
  def home
    @arts = Art.all.order(created_at: :desc)
  end
end
