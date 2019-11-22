class SearchController < ApplicationController
  def index
    requests = search_params.split(' ')
    images = []
    for request in requests
      images << Image.search(request)
      tags = Tag.search(request)
      for tag in tags
        for image in tag.images
          images << image
        end
      end
    end
    @images = images.flatten!
    @tags = get_tags_from_images(@images)
    @pagy, @images = pagy_array(@images) if @images != []
  end

  private

  def search_params
    params.require('search')
  end
end
