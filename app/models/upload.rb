class Upload < ApplicationRecord
	belongs_to :uploaded_by, class_name:'User'

	has_many :votes,as: :voteable,dependent: :destroy

	belongs_to :competition
	 
	mount_uploader :name,ImageUploader 
	
end