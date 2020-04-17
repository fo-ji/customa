class MinutesesController < ApplicationController
  def new
    @minutes = Minute.new
    @minutes.documents.new
    @clients = Client.where(user_id: current_user.id)
  end

  def create
    @minutes = Minute.new(minutes_params)
    @clients = Client.where(user_id: current_user.id)
    if @minutes.documents.present?
      @minutes.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def quotation_params
    params.require(:minute).permit(:name, :client_id, documents_attributes: [:document])
  end
end
