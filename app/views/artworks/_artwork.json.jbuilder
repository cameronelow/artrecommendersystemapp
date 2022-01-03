json.extract! artwork, :id, :api_link, :artist_title, :artwork_type_title, :classification_title, :date_display, :department_title, :dimensions, :gallery_title, :image_id, :image_link, :latitude, :longitude, :medium_display, :place_of_origin, :style_title, :title, :created_at, :updated_at
json.url artwork_url(artwork, format: :json)
