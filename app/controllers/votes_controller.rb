class VotesController < ApplicationController
	def new
		@vote = Vote.new
	end


	def create
		@competition = Competition.find(params[:competition_id])
		@vote = @competition.uploads.find(params[:voteable_id]).votes.build(voted_by_id: @current_user.id,competition_id:params[:competition_id])
		if @vote.save
			flash[:success] ="Voted" 
			redirect_to competition_uploads_path(@competition.id)
		end
	end


	def vcreate
		@competition = Competition.find(params[:competition_id])
		@vote = @competition.videos.find(params[:voteable_id]).votes.build(voted_by_id: @current_user.id,competition_id:params[:competition_id])
		if @vote.save
			flash[:success] ="Voted" 
			redirect_to competition_videos_path(@competition.id)
		end
	end


	def participants
		@vote = Vote.all
	end


	def winner
		query = <<-SQL
			SELECT 
			    MAX(count_votes_id) winner, user_id, compt_id
			FROM
			    (SELECT 
			        COUNT(votes.id) AS count_votes_id,
			            uploads.uploaded_by_id AS user_id,
			            uploads.competition_id AS compt_id
			    FROM
			        votes
			    INNER JOIN uploads ON voteable_id = uploads.id
			    WHERE
			        voteable_type = 'Upload'
			    GROUP BY uploads.uploaded_by_id , uploads.competition_id)
			GROUP BY compt_id 
			UNION SELECT 
			    MAX(count_votes_id) winner, user_id,compt_id
			FROM
			    (SELECT 
			        COUNT(votes.id) AS count_votes_id,
			            videos.video_uploaded_by_id AS user_id,
			            videos.competition_id AS compt_id
			    FROM
			        votes
			    INNER JOIN videos ON voteable_id = videos.id
			    WHERE
			        voteable_type = 'Video'
			    GROUP BY videos.video_uploaded_by_id , videos.competition_id)
			GROUP BY compt_id;
		SQL
		@vote = Vote.find_by_sql(query)
		# @vote = Vote.find_by_sql("SELECT sometable.*, MAX(winner) total FROM (SELECT votes.*, COUNT(voteable_id) winner FROM votes GROUP BY (voteable_type)) sometable GROUP BY (voteable_id)).first
	end
end
