class ForumsController < ApplicationController
  # outside of major site re-implementation forums are static
  def show
    @params = params
  end
end
