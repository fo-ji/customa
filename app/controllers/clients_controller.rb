class ClientsController < ApplicationController

  before_action :set_client, only: [:show, :edit, :update]

  def index
    @clients    = Client.where(user_id: current_user.id)
    @quotations = Document.where(user_id: current_user.id, category: 0).rank(:row_order)
    @minutes    = Document.where(user_id: current_user.id, category: 1).rank(:row_order)
    @others     = Document.where(user_id: current_user.id, category: 2).rank(:row_order)
  end
  
  def selected_client
    respond_to do |format|
      format.html
      format.json do
        selected_client      = Client.find(params[:client_id])
        @selected_quotations = selected_client.documents.where(category: 0)
        @selected_minutes    = selected_client.documents.where(category: 1)
        @selected_others     = selected_client.documents.where(category: 2)
      end
    end
  end

  def sort
    document = Document.find(params[:document_id])
    document.update(document_params)
    render nothing: true
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @client.update(client_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    client = Client.find(params[:id])
    if client.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:company_name, :responsible_party, :address, :postal_code, :phone_number, :email).merge(user_id: current_user.id)
  end

  def document_params
    params.require(:document).permit(:row_order_position)
  end
end
