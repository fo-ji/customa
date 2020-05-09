class UsersController < ApplicationController
  def index
    @quotations = Document.joins(:bookmarks).where(user_id: current_user.id, category: 0)
    @minutes    = Document.joins(:bookmarks).where(user_id: current_user.id, category: 1)
    @others     = Document.joins(:bookmarks).where(user_id: current_user.id, category: 2)
    @recent_quotations = Document.where(user_id: current_user.id, category: 0).order(created_at: "DESC").limit(5)
    @recent_minutes    = Document.where(user_id: current_user.id, category: 1).order(created_at: "DESC").limit(5)
    @recent_others     = Document.where(user_id: current_user.id, category: 0).order(created_at: "DESC").limit(5)
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
