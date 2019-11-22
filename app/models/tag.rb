class Tag < ApplicationRecord
  has_many :taggings
  has_many :images, through: :taggings

  after_save ThinkingSphinx::RealTime.callback_for(:tag)

  def self.save_tag(tag)
    Tag.create!(name: tag)
    rescue ActiveRecord::RecordNotUnique
  end
end
