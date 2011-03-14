class AddDescriptionToTutorialMedias < ActiveRecord::Migration
  def self.up
    add_column :tutorial_medias, :description, :text
  end

  def self.down
    remove_column :tutorial_medias, :description
  end
end