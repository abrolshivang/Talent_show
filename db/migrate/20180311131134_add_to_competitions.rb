class AddToCompetitions < ActiveRecord::Migration[5.2]
  def change
  	add_column :competitions,:competition_type,:string
  end
end
