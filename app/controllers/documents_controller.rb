class DocumentsController < ApplicationController

  before_action :set_document,  only: [:show, :edit, :update]
  before_action :set_client,    only: [:new, :create, :edit]

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    if @document.present?
      @document.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment  = Comment.new
    @comments = @document.comments
  end

  def edit
  end

  def update
    if @document.update(document_params)
      redirect_to document_path
    else
      render :edit
    end
  end

  def destroy
    document = Document.find(params[:id])
    if document.destroy
      redirect_to root_path
    else
      render :edit
    end
  end
  
  private

  def set_document
    @document = Document.find(params[:id])
  end

  def set_client
    @clients = Client.where(user_id: current_user.id)
  end

  def document_params
    params.require(:document).permit(:name, :category, :document, :client_id, :user_id)
  end
end
