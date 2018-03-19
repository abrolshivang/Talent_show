class VideosController < ApplicationController
  before_action :set_video_upload, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new,:destroy]
  include ApplicationHelper


  def index
    @competition = Competition.find(params[:competition_id])
    @videos = @competition.videos
  end

 
  def show
    @competition = Competition.find(params[:competition_id])
  end

 

  def new
    @competition = Competition.find(params[:competition_id])
    @video = Video.new
  end

 
  
  def edit
  end
 
  
  def create
    @competition = Competition.find(params[:competition_id])
    @video = Video.new(post_video_params)
    @video.video_uploaded_by_id = @current_user.id
    @video.competition_id =  params[:competition_id]
    if @video.save
      flash[:success] ='video was successfully created.'
      redirect_to competition_videos_path
    else
      render 'new'
    end
  end

 
  
  def update
    if @video.update(post_video_params)
      flash[:success] = 'Video attachment was successfully updated.'
      redirect_to @video 
    else
      render 'edit'
    end
  end

 
  
  def destroy
    if admin or @video.video_uploaded_by_id == @current_user.id
      @video.destroy
      flash[:success] = 'Upload was successfully destroyed.'
      redirect_to competition_videos_url 
    else
      flash[:danger] = "Permission Denied"
      redirect_to competition_videos_url      
    end
  end


 
  private
    
    def set_video_upload
      @video = Video.find(params[:id])
    end

    
 
    def post_video_params
      params.require(:video).permit(:video,:competition_id)
    end
end