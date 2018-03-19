class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
    	t.string :video
    	t.integer :video_uploaded_by_id
    	t.timestamps
    end
  end
end
