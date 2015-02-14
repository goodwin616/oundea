class SessionsController < ApplicationController
  require 'rspotify'

  def new
  end

  def new
    if logged_in?
      redirect_to search_path
    end
  end

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

  def find
    @tracks = RSpotify::Track.search(params[:session][:search], market: 'US')
    user = current_user
    # spotify_user = RSpotify::User.new(current_user.spotify_hash)
    # spotify_user
    # playlist = spotify_user.find(user.id, user.playlist_id)
  end

  def add


  end



	def destroy
    log_out
    redirect_to root_path
	end

end
