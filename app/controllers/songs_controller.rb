class SongsController < ApplicationController
  def index
    # redirects when artist not found
    if params[:author_id]
      if Artist.find_by(id: params[:author_id])
        @songs = Artist.find_by(id: params[:author_id]).songs
      else
        redirect_to artists_path, alert: "Artist not found"
      end
    else
        @songs = Song.all
    end
  end

  def show
    # redirects to artists songs when aartist song not found
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end
