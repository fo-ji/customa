class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html { redirect_to document_path(params[:document_id])  }
      format.json
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(document_id: params[:document_id], user_id: current_user.id)
  end
end
