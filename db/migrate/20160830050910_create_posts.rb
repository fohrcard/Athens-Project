class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user, foreign_key: true
      t.string :image_one
      t.string :image_two

      t.timestamps
    end
    add_index :posts, :created_at
  end
end
