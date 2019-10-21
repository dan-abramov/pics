class UpdateImageForeignKey < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :taggings, :images
    add_foreign_key :taggings, :images, on_delete: :cascade
  end
end
