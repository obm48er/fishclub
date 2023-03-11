class CreateShips < ActiveRecord::Migration[6.1]
  def change
    create_table :ships do |t|
      t.references :city, null: false, foreign_key: true
      t.string :name, null: false
      t.string :body, null: false
      t.string :phone_number,null: false
      t.timestamps
    end
  end
end
