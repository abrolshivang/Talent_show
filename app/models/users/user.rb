class User < ApplicationRecord
	
	has_secure_password

	has_many :upload_user, class_name:"Upload",foreign_key:'uploaded_by_id'

	has_many :voted_user,class_name:"Vote",foreign_key:'voted_by_id'

	before_save{ self.email = email.downcase}

	before_save{self.name = name.capitalize}

	validates :name, presence: true,length: {minimum: 5,maximum:25}

	VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :email, presence: true,uniqueness:true,format:{with: VALID_EMAIL_REGEX}
	
	validates :telephone, presence: true, length: {minimum:10,maximum:11}

end