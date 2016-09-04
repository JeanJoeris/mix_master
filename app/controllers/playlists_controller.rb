class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def new
    @playlist = Playlist.new
    @songs = Song.all
  end

  def create
    @playlist = Playlist.create(playlist_params)
    redirect_to @playlist
  end

  def edit
    @playlist = Playlist.find(params[:id])
    @songs = Song.all
  end

  def update
    @playlist = Playlist.find(params[:id])
    if @playlist.update(playlist_params)
      redirect_to @playlist
    else
      render :edit
    end
  end

  def playlist_params
    params.require(:playlist).permit(:name, song_ids: [])
  end
end
