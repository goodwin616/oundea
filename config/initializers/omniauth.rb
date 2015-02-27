Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, '941e67ac3eea40bfaeed052626a07c4a', '######################', scope: 'playlist-read-private user-read-private user-read-email playlist-modify playlist-modify-private'
end
