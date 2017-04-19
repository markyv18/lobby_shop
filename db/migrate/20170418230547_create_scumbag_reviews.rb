class CreateScumbagReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :scumbag_reviews do |t|
      t.references :scumbag, foreign_key: true
      t.references :review, foreign_key: true
    end
  end
end
