ThinkingSphinx::Index.define :image, with: :real_time do
  indexes title
  indexes description

  has created_at, :type => :timestamp
  has updated_at, :type => :timestamp
end
