require 'flickraw'

FlickRaw.api_key= "#{Rails.application.secrets.flickr_api_key}"
FlickRaw.shared_secret= "#{Rails.application.secrets.flickr_shared_secret}"
