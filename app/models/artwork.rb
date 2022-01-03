# == Schema Information
#
# Table name: artworks
#
#  id                   :integer          not null, primary key
#  api_link             :string
#  artist_title         :string
#  artwork_type_title   :string
#  classification_title :string
#  date_display         :string
#  department_title     :string
#  dimensions           :string
#  gallery_title        :string
#  image_id             :string
#  image_link           :string
#  latitude             :string
#  longitude            :string
#  medium_display       :string
#  place_of_origin      :string
#  style_title          :string
#  title                :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Artwork < ApplicationRecord
end
