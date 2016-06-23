class Flickr
  def self.find(request, count = 10)
    flickr.photos.search(text: request, media: "photos", per_page: count)
  end
end
