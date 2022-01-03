class CreateArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.string :api_link
      t.string :artist_title
      t.string :artwork_type_title
      t.string :classification_title
      t.string :date_display
      t.string :department_title
      t.string :dimensions
      t.string :gallery_title
      t.string :image_id
      t.string :image_link
      t.string :latitude
      t.string :longitude
      t.string :medium_display
      t.string :place_of_origin
      t.string :style_title
      t.string :title

      t.timestamps
    end
  end
end
