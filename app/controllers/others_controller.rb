class OthersController < ApplicationController

  before_action :set_other,  only: [:show, :edit, :update]
  before_action :set_client, only: [:new, :create, :edit]

  def new
    @other = Other.new
    @other.documents.new
  end

  def create
    @other = Other.new(other_params)
    if @other.documents.present?
      @other.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @other.comments
  end

  def edit
  end

  def update
    if @other.update(other_params)
      redirect_to other_path
    else
      render :edit
    end
  end

  def destroy
    other = Other.find(params[:id])
    if other.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def set_other
    @other = Other.find(params[:id])
  end

  def set_client
    @clients = Client.where(user_id: current_user.id)
  end

  def other_params
    params.require(:other).permit(:name, :client_id, documents_attributes: [:document])
  end
end
