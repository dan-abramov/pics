class ImagesController < ApplicationController
  include ApplicationHelper

  def new
    @image = Image.new
  end

  def index
    if search_params
      requests = search_params['search_request'].split(' ')
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
      @pagy = []
    else
      images = Image.all
      @pagy, @images = pagy(images)
    end
    @tags = get_tags_from_images(images)
    pry
  end

  def create
    @image = Image.create!(image_params)
    Tagging.create_relationships(tags, @image) if tags != ''

    redirect_to @image
  end

  def show
    @image = Image.find(params[:id])
  end

  private

  def image_params
    params.require(:image).permit(:title, :description, :image, :user_id)
  end

  def search_params
    if params['/images']
      params.require('/images').permit(:search_request)
    end
  end

  def tags
    params.require(:image).permit(:tags)[:tags]
  end
end
