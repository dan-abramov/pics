class Image < ApplicationRecord
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings
  has_one_attached :image

  after_save ThinkingSphinx::RealTime.callback_for(:image)
end
