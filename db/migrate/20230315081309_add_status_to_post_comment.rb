class AddStatusToPostComment < ActiveRecord::Migration[6.1]
  def change
    add_column :post_comments, :status, :boolean, default: false, null: false
   
  end
end
