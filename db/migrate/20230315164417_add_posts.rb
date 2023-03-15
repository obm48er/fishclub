class AddPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :status, :boolean, default: false, null: false
    add_column :posts, :is_deleted, :boolean, default: false, null: false
  end
end
