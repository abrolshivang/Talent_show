class Vote <ApplicationRecord

	belongs_to :voted_by,class_name:"User"

	belongs_to :voteable,polymorphic:true
	
end