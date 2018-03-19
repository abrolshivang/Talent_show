class AddDefaultValueToUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :type,:string, default:"User"
  end
  
end
