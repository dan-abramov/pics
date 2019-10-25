class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def index
    @pagy, @images = pagy(Image.all)
    images = Image.all
    @tags = []
    images.each do |image|
      @tags << image.tags
    end
    @tags.flatten!.uniq!
    @tags = @tags.sort_by { |tag| tag.images.length }.reverse
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

  def tags
    params.require(:image).permit(:tags)[:tags]
  end
end
