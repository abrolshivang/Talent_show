class UserMailer < ApplicationMailer
	default from:'friendsconnect15@gmail.com' 
	
	def welcome_email(user)
		@user = user
		@url = 'localhost:3000/signin'
		mail(to:@user.email, subject:'Thank you for joining Talent Arena')
	end

end
