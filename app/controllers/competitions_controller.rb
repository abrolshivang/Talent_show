class CompetitionsController < ApplicationController
	include ApplicationHelper


	def new
		@competition = Competition.new
	end


	def create
		@competition = Competition.new(competition_params)
		if @competition.save
			flash[:success] ="Dear Admin,Competition created" 
			redirect_to competitions_path
		else
			render 'new'
		end
	end

	

	def destroy
		if admin
			@competition = Competition.find(params[:id])
	    @competition.destroy
	    flash[:danger] = 'Competition deleted'
	    redirect_to user_path 
	  else
	  		flash[:danger] = "Permission denied"
	  		redirect_to user_path 
    end     
  end



  def show
  	@competition = Competition.find(params[:id])
  	@upload = @competition.uploads
  end



  def index
		@competitions = Competition.all
	end



	private

	def competition_params
		params.require(:competition).permit(:caption,:tagline,:button_name,:competition_type,:ending_date,:name)
	end
	
end