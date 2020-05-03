class UsersController < ApplicationController
  def index
    @quotations = Quotation.joins(:bookmarks).where(user_id: current_user.id)
    @minutes    = Minute.joins(:bookmarks).where(user_id: current_user.id)
    @others     = Other.joins(:bookmarks).where(user_id: current_user.id)
    @recent_quotations = Quotation.where(user_id: current_user.id).order(created_at: "DESC").limit(5)
    @recent_minutes    = Minute.where(user_id: current_user.id).order(created_at: "DESC").limit(5)
    @recent_others     = Other.where(user_id: current_user.id).order(created_at: "DESC").limit(5)
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
