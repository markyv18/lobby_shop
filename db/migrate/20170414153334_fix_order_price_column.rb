class FixOrderPriceColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :price, :total_price
  end
end
