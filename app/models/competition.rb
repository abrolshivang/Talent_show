class Competition < ApplicationRecord

	has_many :uploads,dependent: :destroy
	 
	has_many :videos,dependent: :destroy

 	mount_uploader :name, CompetitionUploader	

end