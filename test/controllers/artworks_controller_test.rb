require "test_helper"

class ArtworksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artwork = artworks(:one)
  end

  test "should get index" do
    get artworks_url
    assert_response :success
  end

  test "should get new" do
    get new_artwork_url
    assert_response :success
  end

  test "should create artwork" do
    assert_difference("Artwork.count") do
      post artworks_url, params: { artwork: { api_link: @artwork.api_link, artist_title: @artwork.artist_title, artwork_type_title: @artwork.artwork_type_title, classification_title: @artwork.classification_title, date_display: @artwork.date_display, department_title: @artwork.department_title, dimensions: @artwork.dimensions, gallery_title: @artwork.gallery_title, image_id: @artwork.image_id, image_link: @artwork.image_link, latitude: @artwork.latitude, longitude: @artwork.longitude, medium_display: @artwork.medium_display, place_of_origin: @artwork.place_of_origin, style_title: @artwork.style_title, title: @artwork.title } }
    end

    assert_redirected_to artwork_url(Artwork.last)
  end

  test "should show artwork" do
    get artwork_url(@artwork)
    assert_response :success
  end

  test "should get edit" do
    get edit_artwork_url(@artwork)
    assert_response :success
  end

  test "should update artwork" do
    patch artwork_url(@artwork), params: { artwork: { api_link: @artwork.api_link, artist_title: @artwork.artist_title, artwork_type_title: @artwork.artwork_type_title, classification_title: @artwork.classification_title, date_display: @artwork.date_display, department_title: @artwork.department_title, dimensions: @artwork.dimensions, gallery_title: @artwork.gallery_title, image_id: @artwork.image_id, image_link: @artwork.image_link, latitude: @artwork.latitude, longitude: @artwork.longitude, medium_display: @artwork.medium_display, place_of_origin: @artwork.place_of_origin, style_title: @artwork.style_title, title: @artwork.title } }
    assert_redirected_to artwork_url(@artwork)
  end

  test "should destroy artwork" do
    assert_difference("Artwork.count", -1) do
      delete artwork_url(@artwork)
    end

    assert_redirected_to artworks_url
  end
end
