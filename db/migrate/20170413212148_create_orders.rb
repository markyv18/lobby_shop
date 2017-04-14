class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :price
      t.integer :status, default: 0
      t.references :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
