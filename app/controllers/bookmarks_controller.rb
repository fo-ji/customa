class BookmarksController < ApplicationController
  def create
    user = current_user
    document = Document.find(params[:document_id])
    if Bookmark.create(user_id: user.id, document_id: document.id)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    user = current_user
    document = Document.find(params[:document_id])
    if bookmark = Bookmark.find_by(user_id: user.id, document_id: document.id)
      bookmark.delete
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
end
