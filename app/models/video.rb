class Video < ApplicationRecord
	
	 belongs_to :video_uploaded_by, class_name:'User'

	 has_many :votes,as: :voteable,dependent: :destroy

   mount_uploader :video, VideoUploader  

   belongs_to :competition

end