class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :artworks, :title, null: false
      t.text :artworks, :image_url, null: false
      t.integer :artworks, :artist_id, null: false
      t.timestamps
    end
  end
end
