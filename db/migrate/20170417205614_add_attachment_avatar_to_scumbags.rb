class AddAttachmentAvatarToScumbags < ActiveRecord::Migration
  def self.up
    change_table :scumbags do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :scumbags, :avatar
  end
end
