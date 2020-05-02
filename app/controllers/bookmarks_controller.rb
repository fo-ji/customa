class BookmarksController < ApplicationController
  def create_quotation_bookmark
    user = current_user
    quotation = Quotation.find(params[:quotation_id])
    if Bookmark.create(user_id: user.id, quotation_id: quotation.id)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy_quotation_bookmark
    user = current_user
    quotation = Quotation.find(params[:quotation_id])
    if bookmark = Bookmark.find_by(user_id: user.id, quotation_id: quotation.id)
      bookmark.delete
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def create_minute_bookmark
    user = current_user
    minute = Minute.find(params[:minute_id])
    if Bookmark.create(user_id: user.id, minute_id: minute.id)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy_minute_bookmark
    user = current_user
    minute = Minute.find(params[:minute_id])
    if bookmark = Bookmark.find_by(user_id: user.id, minute_id: minute.id)
      bookmark.delete
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
end
