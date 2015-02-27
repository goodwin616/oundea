Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, '941e67ac3eea40bfaeed052626a07c4a', '70083348e3d74733b08a016bfdff7c22', scope: 'playlist-read-private user-read-private user-read-email playlist-modify playlist-modify-private'
end