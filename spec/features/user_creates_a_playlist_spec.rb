require 'rails_helper'

RSpec.feature "User creates a playlist" do
  scenario "they see the correct songs on the playlist they build" do
    # As a user
    # Given that songs and artists exist in the database
    # When I visit the playlists path
    # And I click "New playlist"
    # And I fill in a name
    # And I select the songs for the playlist
    # And I click "Create Playlist"
    # Then I see the playlist title
    # And I see the titles of all songs in that playlist
    # And the titles should link to the individual song pages
    song_1, song_2, song_3 = create_list(:song, 3)
    playlist_name = "tunes"

    visit playlists_path
    click_on "New playlist"
    fill_in "playlist_name", with: playlist_name
    check("song-#{song_1.id}")
    check("song-#{song_3.id}")
    click_on "Create Playlist"

    expect(page).to have_content playlist_name

    within("li:first") do
      expect(page).to have_link song_1.title, href: song_path(song_1)
    end

    within("li:last") do
      expect(page).to have_link song_3.title, href: song_path(song_3)
    end

  end
end
