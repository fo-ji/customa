class QuotationsController < ApplicationController
  def new
    @quotation = Quotation.new
    @quotation.documents.new
  end

  def create
    @quotation.new(quotation_params)
    if @quotation.documents.present?
      @quotation.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def quotation_params
    params.require(:quotation).permit(:name, :client_id, document_attributes: [:document])
  end
end
