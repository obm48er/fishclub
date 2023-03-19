class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      #t.references :user,type: :bigint, null: false, foreign_key: true
      #t.references :ship, null: false, foreign_key: true
      t.bigint :user_id, null: false,
      t.bigint :ship_id, null: false,
      t.string :title, null: false
      t.string :body, null: false
      t.integer :star,null: false, default: "0"
      t.timestamps
    end
    
    add_foreign_key :reviews, :users, column: :user_id
    add_foreign_key :reviews, :ships, column: :ship_id
  end
end
