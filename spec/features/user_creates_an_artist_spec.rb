
require 'rails_helper'

RSpec.feature "User submits a new artist" do
  scenario "they see the page for the individual artist" do
    # As a user
    # when I visit the artists index
    # and I click the new artist button
    # and I fill in the name
    # and I fill in the image path
    # and I click the create artist button
    # then I should see the artist's name and picture on the page
    artist_name = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    visit '/artists'
    click_on("New Artist")

    expect(current_path).to eq('/artists/new')

    fill_in("artist_name", with: artist_name)
    fill_in("artist_image_path", with: artist_image_path)
    click_on("Create Artist")

    expect(current_path).to eq("/artists/#{Artist.last.id}")
    within("div.artist_info") do
      expect(page).to have_content artist_name
      expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
    end
  end

  context "the submitted data is invalid" do
    scenario "they see an error message" do
      pending
      # as a User
      # when I visit the artist index
      # and I click new artist
      # and I fill in an image path
      # and I click create artist
      # then I should see "name cannot be blank" on the page
      artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

      visit '/artists'
      click_on "New Artist"

      fill_in "artist_image_path", with: artist_image_path
      click_on "Create Artist"

      expect(page).to have_content "Name cannot be blank!"
    end
  end
end
