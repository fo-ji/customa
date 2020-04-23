class QuotationsController < ApplicationController

  before_action :set_quotation, only: [:show, :edit, :update]
  before_action :set_client,    only: [:new, :create, :edit]

  def new
    @quotation = Quotation.new
    @quotation.documents.new
  end

  def create
    @quotation = Quotation.new(quotation_params)
    if @quotation.documents.present?
      @quotation.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @quotation.comments
  end

  def edit
  end

  def update
    if @quotation.update(quotation_params)
      redirect_to quotation_path
    else
      render :edit
    end
  end

  def destroy
    quotation = Quotaton.find(params[:id])
    if quotation.destroy
      redirect_to root_path
    else
      render :edit
    end
  end
  
  private

  def set_quotation
    @quotation = Quotation.find(params[:id])
  end

  def set_client
    @clients = Client.where(user_id: current_user.id)
  end

  def quotation_params
    params.require(:quotation).permit(:name, :client_id, documents_attributes: [:document])
  end
end
