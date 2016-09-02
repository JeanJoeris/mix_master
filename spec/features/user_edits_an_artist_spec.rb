require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "they see the updated artist information" do
    # As a user
    # Given that an artist exists in the database
    # When I visit that artist's show page
    # And I click on "Edit"
    # And I fill in a new name
    # And I click on "Update Artist"
    # Then I should see the artist's updated name
    # Then I should see the existing image

    the_wu = Artist.create(name: "Wu-Tang Clan", image_path: "http://images1.mtv.com/uri/mgid:uma:video:mtv.com:1104536?width=657&height=370&crop=true&quality=0.85")
    queen = Artist.create(name: "Queen", image_path: "http://www.virginemirecords.com/wp-content/uploads/2015/10/QUEEN.jpg")

    visit artist_path(queen)

    click_on("Edit")
    fill_in("artist_name", with: "Queen, the Greatest Rock Band of All Time")
    click_on("Update Artist")

    expect(current_path).to eq(artist_path(queen))

    within("div.artist_info") do
      expect(page).to have_content "Queen, the Greatest Rock Band of All Time"
      expect(page).to have_css("img[src=\"#{queen.image_path}\"]")
    end
  end
end
