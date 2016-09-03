require 'rails_helper'

RSpec.feature "User edits a playlist" do
  scenario "they see the edited properties" do
    # As a user
    # Given that a playlist and songs exist in the database
    # When I visit that playlist's show page
    # And I click on "Edit"
    # And I enter a new playlist name
    # And I select an additional song
    # And I uncheck an existing song
    # And I click on "Update Playlist"
    # Then I should see the playlist's updated name
    # And I should see the name of the newly added song
    # And I should not see the name of the removed song
    playlist = create(:playlist)
    song = create(:song)
    playlist_song_1, playlist_song_2 = create_list(:playlist_song, 2, playlist: playlist)

    visit playlist_path(playlist)

    click_on "Edit"
    expect(playlist.songs.count).to eq(2)

    fill_in "playlist_name", with: "editted tunage"

    check("song-#{song.id}")
    uncheck("song-#{playlist_song_2.song.id}")
    click_on "Update Playlist"

    expect(page).to have_content "editted tunage"
    expect(playlist.songs.count).to eq(2)
    
    within("ul") do
      expect(page).to have_link playlist_song_1.song.title, href: song_path(playlist_song_1.song)
      expect(page).to_not have_link playlist_song_2.song.title, href: song_path(playlist_song_2.song)
      expect(page).to have_link song.title, href: song_path(song)
    end





  end
end
