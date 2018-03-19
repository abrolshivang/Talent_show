class AddToVotes < ActiveRecord::Migration[5.2]
  def change
  	add_column :votes ,:competition_id,:integer
  	add_column :uploads ,:competition_id,:integer
  	add_column :videos ,:competition_id,:integer

  end
end
