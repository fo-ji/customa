class QuotationsController < ApplicationController
  def new
    @quotation = Quotation.new
    @quotation.documents.new
    @clients = Client.where(user_id: current_user.id)
  end

  def create
    @quotation = Quotation.new(quotation_params)
    @clients = Client.where(user_id: current_user.id)
    if @quotation.documents.present?
      @quotation.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @quotaton = Quotation.find(params[:id])
  end

  private

  def quotation_params
    params.require(:quotation).permit(:name, :client_id, documents_attributes: [:document])
  end
end
