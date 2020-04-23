class MinutesController < ApplicationController

  before_action :set_minute, only: [:show, :edit, :update]
  before_action :set_client, only: [:new, :create, :edit]

  def new
    @minute = Minute.new
    @minute.documents.new
  end

  def create
    @minute = Minute.new(minute_params)
    if @minute.documents.present?
      @minute.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @minute.comments
  end

  def edit
  end

  def update
    if @minute.update(minute_params)
      redirect_to minute_path
    else
      render :edit
    end
  end

  def destroy
    minute = Minute.find(params[:id])
    if minute.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def set_minute
    @minute = Minute.find(params[:id])
  end

  def set_client
    @clients = Client.where(user_id: current_user.id)
  end

  def minute_params
    params.require(:minute).permit(:name, :client_id, documents_attributes: [:document])
  end
end
