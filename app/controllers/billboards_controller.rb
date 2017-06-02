class BillboardsController < ApplicationController
  before_action :set_billboard, except: [:index, :new, :create]

  # GET /billboards
  def index
    @billboards = Billboard.all
  end

  # GET /billboards/1
  def show
    @songs = @billboard.songs
  end

  # GET /billboards/new
  def new
    @billboard = Billboard.new
  end

  # GET /billboards/1/edit
  def edit
  end

  # POST /billboards
  def create
    @billboard = Billboard.new(billboard_params)

    if @billboard.save
      redirect_to @billboard
    else
      render :new
    end
  end

  # PATCH/PUT /billboards/1
  def update
    if @billboard.update(billboard_params)
      redirect_to @billboard
    else
      render :edit
    end
  end

  # DELETE /billboards/1
  def destroy
    @billboard.destroy
    redirect_to billboards_url
  end

  def new_song
    # Grab all songs that don't already belong to a billboard
    @songs = Song.all.where(billboard_id: nil)
  end

  def add_song
    @billboard.songs << Song.find(params[:song_id])
    redirect_to billboard_path(@billboard)
  end

  def remove_song
    # remove the billboard_id so it is no longer associated
    Song.find(params[:song_id]).update(billboard_id: nil)
    redirect_to billboard_path(@billboard)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_billboard
      @billboard = Billboard.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def billboard_params
      params.require(:billboard).permit(:name)
    end
end
