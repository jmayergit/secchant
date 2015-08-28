class ArtsController < ApplicationController
  before_action :authenticate_admin!, except: :show
  def show
    @art = Art.find(params[:id])

    @comment = @art.comments.new
  end

  def new
    @art = Art.new
  end

  def create
    @art = Art.new(art_params)
    @art.image = params[:art][:image].read
    if @art.save
      redirect_to art_path(@art)
    else
      flash[:error] = "Unable to save"
      redirect_to new_art_path
    end
  end

  private

  def art_params
    params.require(:art).permit(:title, :subject)
  end

end
