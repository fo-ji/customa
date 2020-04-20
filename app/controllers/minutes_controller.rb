class MinutesController < ApplicationController
  def new
    @minute = Minute.new
    @minute.documents.new
    @clients = Client.where(user_id: current_user.id)
  end

  def create
    @minute = Minute.new(minute_params)
    @clients = Client.where(user_id: current_user.id)
    if @minute.documents.present?
      @minute.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @minute = Minute.find(params[:id])
  end

  private

  def minute_params
    params.require(:minute).permit(:name, :client_id, documents_attributes: [:document])
  end
end
