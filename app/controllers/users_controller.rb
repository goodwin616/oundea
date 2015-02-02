class UsersController < ApplicationController
  def callback


  spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
  @user = User.new
   #    if User.find_by(email: spotify_user.email.downcase) == nil
  @user.name =  spotify_user.display_name
  @user.email = spotify_user.email.downcase
  test_code = SecureRandom.hex(3)
  until (User.find_by(room_code: test_code) == nil)
    test_code = SecureRandom.hex(3)
  end
  @user.room_code = test_code.upcase
  @user.spotify_hash = spotify_user.to_hash
  playlist = spotify_user.create_playlist!('Oundea')
  @user.playlist_id = playlist
  @user.save
   #  end
  end
end
