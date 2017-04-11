class AddPartyToScumbags < ActiveRecord::Migration[5.0]
  def change
    add_reference :scumbags, :party, index: true, foreign_key: :true
  end
end