class SongsController < ApplicationController
  before_action :set_artist
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  # GET /songs
  def index
    @songs = @artist.songs.all
  end

  # GET /songs/1
  def show
  end

  # GET /songs/new
  def new
    @song = @artist.songs.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  def create
    @song = @artist.songs.new(song_params)

    if @song.save
      redirect_to artist_song_path(@artist, @song)
    else
      render :new
    end
  end

  # PATCH/PUT /songs/1
  def update
    if @song.update(song_params)
      redirect_to artist_song_path(@artist, @song)
    else
      render :edit
    end
  end

  # DELETE /songs/1
  def destroy
    @song.destroy
    redirect_to artist_songs_path(@artist)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = @artist.songs.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:artist_id])
    end

    # Only allow a trusted parameter "white list" through.
    def song_params
      params.require(:song).permit(:title, :duration, :belongs_to, :belongs_to)
    end
end
