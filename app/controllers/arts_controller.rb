class ArtsController < ApplicationController
  def show
    @art = Art.find(params[:id])

    @comment = @art.comments.new
  end
end
