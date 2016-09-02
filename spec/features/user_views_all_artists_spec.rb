require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they see all artists on the index page" do
    # As a user
    # Given that artists exist in the database
    # When I visit the artists index
    # Then I should see each artist's name
    # And each name should link to that artist's individual page
    
    the_wu = Artist.create(name: "Wu-Tang Clan", image_path: "http://images1.mtv.com/uri/mgid:uma:video:mtv.com:1104536?width=657&height=370&crop=true&quality=0.85")
    queen = Artist.create(name: "Queen", image_path: "http://www.virginemirecords.com/wp-content/uploads/2015/10/QUEEN.jpg")

    visit artists_path

    within("div.artists_list") do
      page { is_expected.to have_link('Wu-Tang Clan', href=artists_path(the_wu.id)) }
      page { is_expected.to have_link('Queen', href=artists_path(queen.id)) }
    end
  end
end
