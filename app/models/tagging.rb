class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :image

  def self.create_relationships(tags, image)
    tags.split(' ').each do |tag|
      Tag.save_tag(tag)
      tag_id = Tag.where(name: tag)[0].id

      Tagging.create!(tag_id: tag_id, image_id: image.id)
    end
  end
end
