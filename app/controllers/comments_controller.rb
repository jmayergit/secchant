class CommentsController < ApplicationController
  before_action :require_login, only: [:edit, :create]

  def create
    @art = Art.find(params[:comment][:art_id])
    @comment = @art.comments.new(comment_params)

    if @comment.save
      @comment.update(user_id: current_user.id)
      redirect_to art_path(@art)
    else
      flash[:error] = "Comment Not Created"
      redirect_to art_path(@art)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    if @comment.destroy
      flash[:success] = "Comment Was Successfully Destroyed"
      redirect_to admin_panel_path
    else
      flash[:error] = "Unable To Destroy Comment"
      redirect_to admin_panel_path
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:text)
    end

    def require_login
      unless user_signed_in?
        flash[:error] = "You must be logged in to comment"

        redirect_to new_user_session_path
      end
    end
end
