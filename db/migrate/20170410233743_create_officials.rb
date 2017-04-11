class CreateOfficials < ActiveRecord::Migration[5.0]
  def change
    create_table :officials do |t|
      t.string   :name
      t.string   :img_path
      t.integer  :price

      t.timestamps null: false
    end
  end
end
