class AddIndexUploadsOnName < ActiveRecord::Migration
  def change
    add_index :uploads, :name
  end
end
