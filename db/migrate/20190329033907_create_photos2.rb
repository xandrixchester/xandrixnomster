class CreatePhotos2 < ActiveRecord::Migration[5.2]
  def change
    	add_column :photos, :place_id, :integer
  end
end
