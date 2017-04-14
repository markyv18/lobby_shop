class CreateJoinTableScumbagsOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :scumbag_orders do |t|
      t.references :order, foreign_key: true
      t.references :scumbag, foreign_key: true
      t.integer  :scumbag_quantity
      t.integer :scumbag_price

      t.timestamps
    end
  end
end
