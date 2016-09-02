require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario "they do not see a deleted artist" do
    # As a user
    # Given that an artist exists in the database
    # When I visit that artist's show page
    # And I click on "Delete"
    # Then I should be back on the artist index page
    # Then I should not see the artist's name
    the_wu = Artist.create(name: "Wu-Tang Clan", image_path: "http://images1.mtv.com/uri/mgid:uma:video:mtv.com:1104536?width=657&height=370&crop=true&quality=0.85")
    queen = Artist.create(name: "Queen", image_path: "http://www.virginemirecords.com/wp-content/uploads/2015/10/QUEEN.jpg")

    visit artist_path(the_wu)

    click_on "Delete"

    expect(current_path).to eq(artists_path)

    within("div.artists_list") do
      page { is_expected.to not_have_link('Wu-Tang Clan', href=artists_path(the_wu.id)) }
      page { is_expected.to have_link('Queen', href=artists_path(queen.id)) }
    end
  end
end
