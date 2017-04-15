class AddStatusToScumbags < ActiveRecord::Migration[5.0]
  def change
    add_column :scumbags, :status, :integer
  end
end
