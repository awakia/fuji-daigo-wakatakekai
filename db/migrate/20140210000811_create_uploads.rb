class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.references :post, index: true
      t.string :category
      t.string :name
      t.string :file

      t.timestamps
    end
  end
end
