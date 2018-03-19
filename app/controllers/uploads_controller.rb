class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new,:destroy,:show]
  include ApplicationHelper
 

  def index
    @competition = Competition.find(params[:competition_id])
    @uploads =@competition.uploads
  end

 
  def show
    @competition = Competition.find(params[:competition_id])
  end
 

  def new
    @competition = Competition.find(params[:competition_id])
    @upload = Upload.new
  end
 
  
  def edit
  end
 
  
  def create
    @competition = Competition.find(params[:competition_id])
    @upload = Upload.new(post_upload_params)
    @upload.uploaded_by_id = @current_user.id
    @upload.competition_id =  params[:competition_id]
    if @upload.save
      flash[:success] ='Upload was successfully created.'
      redirect_to competition_uploads_path(competition_id: params[:competition_id])
    else
      render 'new'
    end
  end
 
  
  def update
    if @upload.update(post_upload_params)
      flash[:success] = 'Upload attachment was successfully updated.'
      redirect_to @upload 
    else
      render 'edit'
    end
  end
 
  
  def destroy
    if admin or @upload.uploaded_by_id == @current_user.id
      @upload.destroy
      flash[:success] = 'Upload was successfully destroyed.'
      redirect_to competition_uploads_url 
    else
      flash[:danger] = "Permission Denied"
      redirect_to competition_uploads_url      
    end

  end
 
  private
    
    def set_upload
      @upload = Upload.find(params[:id])
    end
 
    def post_upload_params
      params.require(:upload).permit(:name,:competition_id)
    end
end