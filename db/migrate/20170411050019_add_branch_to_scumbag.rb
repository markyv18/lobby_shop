class AddBranchToScumbag < ActiveRecord::Migration[5.0]
  def change
    add_reference :scumbags, :branch, index: true, foreign_key: :true
  end
end
