class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    pry
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
