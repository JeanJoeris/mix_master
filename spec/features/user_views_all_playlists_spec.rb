RSpec.feature "User views all playlists" do
  scenario "" do
    # As a user
    # Given that playlists exists in the db
    # when I visit the playlist index
    # Then I should see the playlists name
    # and each name should link to the playlist's page
    playlist = Playlist.create(name: "my jams")
    playlist_2 = Playlist.create(name: "my tunes")
    song_1, song_2, song_3 = create_list(:song, 3)
    playlist_songs = PlaylistSong.create(song: song_1, playlist: playlist)
    playlist_songs = PlaylistSong.create(song: song_2, playlist: playlist)
    playlist_songs = PlaylistSong.create(song: song_3, playlist: playlist)
    playlist_songs = PlaylistSong.create(song: song_3, playlist: playlist_2)

    visit playlists_path
    expect(page).to have_link "my jams", href: playlist_path(playlist)
    expect(page).to have_link "my tunes", href: playlist_path(playlist_2)
  end
end
