class ChangeDataUserIdShipIdToReview < ActiveRecord::Migration[6.1]
  def change
    change_column :reviews, :user_id, :bigint
    change_column :reviews, :ship_id, :bigint
  end
end
