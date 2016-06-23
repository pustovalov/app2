require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr"
  config.hook_into :webmock
  config.allow_http_connections_when_no_cassette = true
  config.filter_sensitive_data('<oauth_consumer_key>') { Rails.application.secrets.flickr_api_key }
  config.filter_sensitive_data('<oauth_signature>') { Rails.application.secrets.flickr_shared_secret }
end
