class CommentsController < ApplicationController
  def create_quotation
    comment = Comment.new(comment_quotation_params)
    comment.save
    redirect_to "/quotations/#{comment.quotation.id}"

    # 非同期で更新させるように追加実装する

  end

  private

  def comment_quotation_params
    params.require(:comment).permit(:comment).merge(quotation_id: params[:quotation_id])
  end
end
