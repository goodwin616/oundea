Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, '941e67ac3eea40bfaeed052626a07c4a', '549809a5a6d54258bf7ee0dee1b72d25', scope: 'playlist-read-private user-read-private user-read-email'
end