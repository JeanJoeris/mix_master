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
    playlist = create(:playlist_with_songs)
    first, second, third = playlist.songs

    new_song = create(:song)

    visit playlist_path(playlist)

    click_on "Edit"
    expect(playlist.songs.count).to eq(3)

    fill_in "playlist_name", with: "editted tunage"

    check("song-#{new_song.id}")
    uncheck("song-#{first.id}")
    click_on "Update Playlist"

    expect(page).to have_content "editted tunage"
    expect(playlist.songs.count).to eq(3)

    within("ul") do
      expect(page).to have_link second.title, href: song_path(second)
      expect(page).to_not have_link first.title, href: song_path(first)
      expect(page).to have_link new_song.title, href: song_path(new_song)
    end





  end
end
