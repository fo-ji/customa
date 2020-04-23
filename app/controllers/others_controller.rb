class OthersController < ApplicationController
  def new
    @other = Other.new
    @other.documents.new
    @clients = Client.where(user_id: current_user.id)
  end

  def create
    @other = Other.new(other_params)
    @clients = Client.where(user_id: current_user.id)
    if @other.documents.present?
      @other.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @other = Other.find(params[:id])
    @comment = Comment.new
    @comments = @other.comments
  end

  private

  def other_params
    params.require(:other).permit(:name, :client_id, documents_attributes: [:document])
  end
end
