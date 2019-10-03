class Tag < ApplicationRecord
  has_many :taggings
  has_many :images, through: :taggings

  def self.save_tags(tags)

  end
end
