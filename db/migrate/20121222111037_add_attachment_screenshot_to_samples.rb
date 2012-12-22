class AddAttachmentScreenshotToSamples < ActiveRecord::Migration
  def self.up
    change_table :samples do |t|
      t.has_attached_file :screenshot
    end
  end

  def self.down
    drop_attached_file :samples, :screenshot
  end
end
