class CommentsController < ApplicationController
  def create_quotation
    comment = Comment.new(comment_quotation_params)
    if comment.save
      redirect_to "/quotations/#{comment.quotation.id}"
    else
      redirect_to quotation_comment_path
    end
  end

  def create_minute
    comment = Comment.new(comment_minute_params)
    if comment.save
      redirect_to "/minutes/#{comment.minute.id}"
    else
      redirect_to minute_comment_path
    end
  end

  def create_other
    comment = Comment.new(comment_other_params)
    if comment.save
      redirect_to "/others/#{comment.other.id}"
    else
      redirect_to other_comment_path
    end
  end

  private

  def comment_quotation_params
    params.require(:comment).permit(:comment).merge(quotation_id: params[:quotation_id])
  end

  def comment_minute_params
    params.require(:comment).permit(:comment).merge(minute_id: params[:minute_id])
  end

  def comment_other_params
    params.require(:comment).permit(:comment).merge(other_id: params[:other_id])
  end
end
