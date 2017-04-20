class AddTaglineToBranches < ActiveRecord::Migration[5.0]
  def change
    add_column :branches, :tagline, :string
  end
end
