class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :path
      t.string :hash_name
      t.string :title
      t.text :content
      t.integer :format_cd, null: false, default: 0
      t.datetime :published_at

      t.timestamps
    end
    add_index :posts, :path
  end
end
