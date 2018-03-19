class UsersController < ApplicationController
	before_action :require_login, only: [:search,:logout,:show]

	def home
	@competitions = Competition.all
	end


	def new
		@user = User.new
	end


	def create
		@user = User.new(user_params)
		if @user.save
			UserMailer.welcome_email(@user).deliver_now
			flash[:success] ="Sign-up done successfully" 
			redirect_to users_signin_path(@user)
		else
			render 'new'
		end
	end



	def index
		@user = User.all
	end



	def signin
	end



	def login
		@user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
      if @user
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:danger] = "Incorrect Email/Password,Please try again"
        render 'signin'
      end
	end



	def logout
		reset_session
    redirect_to root_path
	end



	def admin_signin
	end



	def admin_login
		@user = Admin.find_by(email: params[:email]).try(:authenticate, params[:password])
      if @user
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:danger] = "Only Admin is allowed to access this section"
        render 'admin_signin'
      end
	end



	def about
	end



	def show
		@competitions = Competition.all
	end



	private

	def user_params
		params.require(:user).permit(:name,:email,:password,:password_confirmation,:gender,:dateofbirth,:telephone)
	end
	
end