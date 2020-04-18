class ClientsController < ApplicationController
  def index
    @clients = Client.where(user_id: current_user.id)
    @quotations = Quotation.all
    @minutes = Minute.all
    @others = Other.all
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

  private

  def client_params
    params.require(:client).permit(:company_name, :responsible_party, :address, :postal_code, :phone_number, :email).merge(user_id: current_user.id)
  end
end
