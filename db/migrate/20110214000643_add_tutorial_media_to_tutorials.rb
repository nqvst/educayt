class AddTutorialMediaToTutorials < ActiveRecord::Migration
  def self.up
    add_column :tutorial_parts, :tutorial_media_id, :integer
  end

  def self.down
    remove_column :tutorial_parts, :tutorial_media_id, :integer
  end
end
