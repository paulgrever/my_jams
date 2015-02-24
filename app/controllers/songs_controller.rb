class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :destroy, :update]

  def index
    @songs = Song.all    
  end

  def show
    # @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    song = Song.new(song_params)
    if song.save
      redirect_to song
    else
      render :new
    end
  end

  def edit
    # @song = Song.find(params[:id])
  end

  def update
    # @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    # @song = Song.find(params[:id]) 
    @song.destroy
    redirect_to songs_path
  end

  private

  def set_song
     @song = Song.find(params[:id])  
  end

  def song_params
    params.require(:song).permit(:title, :artist)
  end
end
