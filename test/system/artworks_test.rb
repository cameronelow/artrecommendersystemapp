require "application_system_test_case"

class ArtworksTest < ApplicationSystemTestCase
  setup do
    @artwork = artworks(:one)
  end

  test "visiting the index" do
    visit artworks_url
    assert_selector "h1", text: "Artworks"
  end

  test "should create artwork" do
    visit artworks_url
    click_on "New artwork"

    fill_in "Api link", with: @artwork.api_link
    fill_in "Artist title", with: @artwork.artist_title
    fill_in "Artwork type title", with: @artwork.artwork_type_title
    fill_in "Classification title", with: @artwork.classification_title
    fill_in "Date display", with: @artwork.date_display
    fill_in "Department title", with: @artwork.department_title
    fill_in "Dimensions", with: @artwork.dimensions
    fill_in "Gallery title", with: @artwork.gallery_title
    fill_in "Image", with: @artwork.image_id
    fill_in "Image link", with: @artwork.image_link
    fill_in "Latitude", with: @artwork.latitude
    fill_in "Longitude", with: @artwork.longitude
    fill_in "Medium display", with: @artwork.medium_display
    fill_in "Place of origin", with: @artwork.place_of_origin
    fill_in "Style title", with: @artwork.style_title
    fill_in "Title", with: @artwork.title
    click_on "Create Artwork"

    assert_text "Artwork was successfully created"
    click_on "Back"
  end

  test "should update Artwork" do
    visit artwork_url(@artwork)
    click_on "Edit this artwork", match: :first

    fill_in "Api link", with: @artwork.api_link
    fill_in "Artist title", with: @artwork.artist_title
    fill_in "Artwork type title", with: @artwork.artwork_type_title
    fill_in "Classification title", with: @artwork.classification_title
    fill_in "Date display", with: @artwork.date_display
    fill_in "Department title", with: @artwork.department_title
    fill_in "Dimensions", with: @artwork.dimensions
    fill_in "Gallery title", with: @artwork.gallery_title
    fill_in "Image", with: @artwork.image_id
    fill_in "Image link", with: @artwork.image_link
    fill_in "Latitude", with: @artwork.latitude
    fill_in "Longitude", with: @artwork.longitude
    fill_in "Medium display", with: @artwork.medium_display
    fill_in "Place of origin", with: @artwork.place_of_origin
    fill_in "Style title", with: @artwork.style_title
    fill_in "Title", with: @artwork.title
    click_on "Update Artwork"

    assert_text "Artwork was successfully updated"
    click_on "Back"
  end

  test "should destroy Artwork" do
    visit artwork_url(@artwork)
    click_on "Destroy this artwork", match: :first

    assert_text "Artwork was successfully destroyed"
  end
end
