class SessionsController < ApplicationController
  require 'rspotify'

  def new
  end

  #Checks if already logged in, otherwise redirect to login screen
  def new
    if logged_in?
      redirect_to search_path
    end
  end

  # Creates a session for attendee, and directs them to search field
  def create
  	user = User.find_by(room_code: params[:session][:room_code])
  	if user != nil
      log_in user
      redirect_to search_path
  	else 
  		flash.now[:danger] = "Invalid Room Code"
  		render 'new'
  	end

	end

  def search

  end


  # Searches Spotify using supplied parameter, finds closest match, and adds to spotify playlist
  def find
    if params[:session][:search].eql? ""
      flash.now[:danger] = "You gotta search for something!"
      render 'search'
    else
    #Adds the most likely choice 
    # !! Future Functionality -- Show top choices, let user pick out of three...
      @user = current_user
      @spotify_user = RSpotify::User.new(@user.spotify_hash)
      playlist = RSpotify::Playlist.find(@user.user_id, @user.playlist_id)
      @tracks = RSpotify::Track.search(params[:session][:search],limit: 1, market: 'US')
      unless (playlist.tracks.last.name == @tracks[0].name)
        playlist.add_tracks!(@tracks)
      end
    end

    # For when you give choices...
    # @tracks1 = RSpotify::Track.search(params[:session][:search],limit: 1, market: 'US')
    # @tracks2 = RSpotify::Track.search(params[:session][:search],limit: 1, offset: 2, market: 'US')
  end

  def add

    # IN PROGRESS
    # @user = current_user
    # @spotify_user = RSpotify::User.new(@user.spotify_hash)
    # playlist = RSpotify::Playlist.find(@user.user_id, @user.playlist_id)
    # if params[:track] == "1"
    #   @tracks1 = RSpotify::Track.search(params[:track_search],limit: 1, market: 'US')
    #   playlist.add_tracks!(@tracks1)
    # elsif params[:track] == "2"
    #   @tracks2 = RSpotify::Track.search(params[:track_search],limit: 1, offset: 2, market: 'US')
    #   playlist.add_tracks!(@tracks2)
    # end

  end


  # When "Leave the Party" is clicked, the user's session is destroyed and returned to home screen
	def destroy
    log_out
    redirect_to root_path
	end

end
