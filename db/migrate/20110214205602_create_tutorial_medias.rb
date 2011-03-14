class CreateTutorialMedias < ActiveRecord::Migration
  def self.up
    create_table :tutorial_medias do |t|
      t.integer :tutorial_media_type_id
      t.integer :tutorial_part_id
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :tutorial_medias
  end
end
