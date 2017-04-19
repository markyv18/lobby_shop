class CreateScumbagDeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :scumbag_deeds do |t|
      t.references :deed, foreign_key: true
      t.references :scumbag, foreign_key: true
    end
  end
end
