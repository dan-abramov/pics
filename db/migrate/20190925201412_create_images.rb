class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :title
      t.text   :description
      t.string :user_id, index: true
      t.timestamps
    end
  end
end
