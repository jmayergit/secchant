class CommentsController < ApplicationController
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

  private
    def comment_params
      params.require(:comment).permit(:text)
    end
end
