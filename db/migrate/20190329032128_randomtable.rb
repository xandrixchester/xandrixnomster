class Randomtable < ActiveRecord::Migration[5.2]
  def change
  	remove_column :photos, :Picture
  end
end
