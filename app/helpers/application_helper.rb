module ApplicationHelper
  include Pagy::Frontend

  def get_tags_from_images(images)
    return [] if images == []
    tags = []
    images.each do |image|
      tags << image.tags
    end
    tags.flatten!.uniq!
    tags = tags.sort_by { |tag| tag.images.length }.reverse
  end
end
