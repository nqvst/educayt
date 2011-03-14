class CreateTutorialMediaTypes < ActiveRecord::Migration
  def self.up
    create_table :tutorial_media_types do |t|
      t.string :media_type

      t.timestamps
    end
  end

  def self.down
    drop_table :tutorial_media_types
  end
end
