class Tag < ApplicationRecord
  has_many :taggings
  has_many :images, through: :taggings

  def self.save_tag(tag)
    Tag.create!(name: tag)
    rescue ActiveRecord::RecordNotUnique
  end
end
