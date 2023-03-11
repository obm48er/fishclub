class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.integer :prefecture_code, null: false, default: "1"
      t.timestamps
    end
  end
end
