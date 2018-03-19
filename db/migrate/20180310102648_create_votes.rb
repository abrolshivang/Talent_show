class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
    	t.integer :voted_by_id
    	t.integer :voted_for_id
    	t.timestamps
    end
  end
end
