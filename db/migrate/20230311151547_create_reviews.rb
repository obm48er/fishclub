class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :ship, null: false, foreign_key: true
      t.string :title, null: false
      t.string :body, null: false
      t.integer :star,null: false, default: "0"
      t.timestamps
    end
  end
end
