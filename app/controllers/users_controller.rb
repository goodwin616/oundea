class UsersController < ApplicationController
  def callback
	  spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
	  @user = User.find_by(email: spotify_user.email.downcase)
	  if @user == nil
	  	@user = User.new
		  @user.name =  spotify_user.display_name
		  @user.email = spotify_user.email.downcase
		  @user.user_id = spotify_user.id
		  test_code = SecureRandom.hex(3)
		  until (User.find_by(room_code: test_code) == nil)
		    test_code = SecureRandom.hex(3)
		  end
		  @user.room_code = test_code.upcase
		  @user.spotify_hash = spotify_user.to_hash
    	  playlist = spotify_user.create_playlist!('Oundea')
		  @user.playlist_id = playlist.id
		  @user.save
	  end 	
	end
end
