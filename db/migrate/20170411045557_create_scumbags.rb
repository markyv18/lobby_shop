class CreateScumbags < ActiveRecord::Migration[5.0]
  def change
    create_table :scumbags do |t|
      t.string :name
      t.integer :price
      t.string :image_path

      t.timestamps null: false
    end
  end
end
