class AddToUploads < ActiveRecord::Migration[5.2]
  def change
  	add_column :uploads,:uploaded_by_id,:integer
  end
end
