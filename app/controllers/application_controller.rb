class ApplicationController < ActionController::Base
	 protect_from_forgery with: :exception
   before_action :set_current_user,:require_login

  def require_login
  	return if @current_user
  	flash[:danger] = "Please login first"
  	redirect_to root_path
  end



	def set_current_user
  	@current_user ||= User.find_by(id: session[:user_id])
  end
  
end
