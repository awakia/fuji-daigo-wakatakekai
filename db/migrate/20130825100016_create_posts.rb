class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :path
      t.string :title
      t.text :content
      t.datetime :published_at

      t.timestamps
    end
    add_index :posts, :path
  end
end
