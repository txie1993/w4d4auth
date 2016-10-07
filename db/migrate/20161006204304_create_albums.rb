class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name, null:false
      t.integer :band_id, null:false
      t.string :live, null:false

      t.timestamps null: false
    end
  end
end
