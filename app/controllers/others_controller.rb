class OthersController < ApplicationController
  def new
    @other = Other.new
    @other.documents.new
    @clients = Client.where(user_id: current_user.id)
  end

  def create
    @clients = Client.where(user_id: current_user.id)
    if @other.documents.present?
      @other.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def other_params
    params.require(:other).permit(:name, :client_id, documents_attributes: [:document])
  end
end
