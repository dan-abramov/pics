class TagsController < ApplicationController
  def show
    @tag = Tag.where(tag_params).first
    @pagy, @images = pagy(@tag.images, items: 15)
  end

  private

  def tag_params
    params.permit(:name)
  end
end
