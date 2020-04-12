class ClientsController < ApplicationController
  def index
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to root_path, notice: 'クライアントを登録しました'
    else
      render :new
    end
  end

  private

  def client_params
    params.require(:client).permit(:company_name, :responsible_party, :address, :postal_code, :phone_number, :email, :user_id)
  end
end
