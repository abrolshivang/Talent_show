class CreateCompetitions < ActiveRecord::Migration[5.2]
  def change
    create_table :competitions do |t|
    	t.string :caption
    	t.string :tagline
    	t.string :button_name
    	t.date   :ending_date
    	t.string :name
    	t.timestamps
    end
  end
end
