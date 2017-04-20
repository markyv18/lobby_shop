class AddImagePathToBranches < ActiveRecord::Migration[5.0]
  def change
    add_column :branches, :image_path, :string
  end
end
