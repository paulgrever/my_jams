class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :destroy, :update]
  before_action :redirect_unless_current_user, only: [:index]
  
  def index

    # @songs = Song.all    
    @songs = current_user.songs  
  end

  def show
    # @song = Song.find(params[:id])
  end

  def new
    if current_user.nil?
      redirect_to login_path, alert: "You Must Login First"
    else
      @song = current_user.songs.create
    end
    # if !current_user.nil?
    #   @song = current_user.songs.create
    # else
    #   @song = Song.new 
    # end
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

