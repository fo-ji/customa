class CommentsController < ApplicationController
  def create_quotation
    comment = Comment.new(comment_quotation_params)
    if comment.save
      redirect_to "/quotations/#{comment.quotation.id}"
    else
      redirect_to quotation_comment_path
    end
  end

  private

  def comment_quotation_params
    params.require(:comment).permit(:comment).merge(quotation_id: params[:quotation_id])
  end
end
